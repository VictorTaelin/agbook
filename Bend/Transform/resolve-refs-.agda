module Bend.Transform.resolve-refs- where

open import Base.Function.case
open import Base.Bool.Bool
open import Base.Bool.eq
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.List.List
open import Base.List.eq
open import Base.String.String
open import Base.String.eq
open import Base.Result.Result
open import Base.Equal.Equal
open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.BinMap.BinMap
open import Base.BinMap.set
open import Base.Pair.Pair
open import Bend.Parser.Fun.parse-term
open import Bend.Transform.resolve-refs
open import Bend.Fun.Num.Num
open import Bend.Fun.Type.Type
open import Bend.Fun.Term.Term renaming (Num to Num')
open import Bend.Fun.Term.show
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.add-fn-def
open import Bend.Fun.dsl
import Bend.Source.from-file-span as Source
import Bend.Fun.Book.new as Book
import Base.BinMap.new as Map
import Bend.Fun.Pattern.Pattern as Pat
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module FnDef = FnDef' Term

parse : String → Result (Reply Term) Error
parse input = parse-term (new-parser-state input)

test-resolve-refs : String → Term
test-resolve-refs input =
  case parse input of λ where
    (Done (MkReply _ parsed-term)) → do
      let book = Book.new
      let book = add-fn-def book (MkFnDef "A" Any True [] (Source.from-file-span 0 0))
      let book = add-fn-def book (MkFnDef "B" Any True [] (Source.from-file-span 0 0))
      resolve-refs-term book Map.new parsed-term
    _ → Era

-- Simple variable reference
_ : (test-resolve-refs "x") ≡ v' "x"
_ = refl

-- Lambda with variable
_ : test-resolve-refs "λx x" ≡ λ' (p' "x") (v' "x")
_ = refl

-- Reference to preexisting definition 'A'
_ : test-resolve-refs "A" ≡ ref' "A"
_ = refl

-- Reference to preexisting definition 'B'
_ : test-resolve-refs "B" ≡ ref' "B"
_ = refl

-- Mix of local and preexisting references
_ : test-resolve-refs "λx (A x B)" ≡ λ' (p' "x") ((ref' "A") $ (v' "x") $ (ref' "B"))
_ = refl

-- Shadowing preexisting definition 'A' in lambda
_ : test-resolve-refs "λA A" ≡ λ' (p' "A") (v' "A")
_ = refl

-- Shadowing preexisting definition 'B' in let binding
_ : test-resolve-refs "let B = 1; B" ≡ (let' (p' "B") := (#u 1) in' (v' "B"))
_ = refl

-- Nested shadowing
_ : test-resolve-refs "λA λB (A B)" ≡ λ' (p' "A") (λ' (p' "B") ((v' "A") $ (v' "B")))
_ = refl

-- Shadowing in different scopes
_ : test-resolve-refs "λA (A (λA A))" ≡ λ' (p' "A") ((v' "A") $ (λ' (p' "A") (v' "A")))
_ = refl

-- Mix of shadowed and non-shadowed references
_ : test-resolve-refs "λA λB (A B (λA λB (A B)))" ≡
    λ' (p' "A") (λ' (p' "B") ((v' "A") $ (v' "B") $ (λ' (p' "A") (λ' (p' "B") ((v' "A") $ (v' "B"))))))
_ = refl

-- Shadowing in let bindings
_ : test-resolve-refs "let A = 1; let B = A; let A = 2; (A B)" ≡
    (let' (p' "A") := (#u 1) in'
      let' (p' "B") := (v' "A") in'
      let' (p' "A") := (#u 2) in'
      ((v' "A") $ (v' "B")))
_ = refl

-- Shadowing in match expression
_ : test-resolve-refs "match A = B { A : A }" ≡
    match' (n' "A") := (ref' "B") with' [] in' ((n' "A" , v' "A") :: [])
_ = refl

-- Shadowing in fold expression
_ : test-resolve-refs "fold A = B { A : A }" ≡
    fold' (n' "A") := (ref' "B") with' [] in' ((n' "A" , v' "A") :: [])
_ = refl

-- Shadowing in bend expression
_ : test-resolve-refs "bend A = B { when A: A else: A }" ≡
    bend' ((n' "A" , ref' "B") :: []) when' (v' "A") step' (v' "A") else' (v' "A")
_ = refl

-- Shadowing in open expression
_ : test-resolve-refs "open T A; A" ≡
    open' "T" := "A" in' (ref' "A")
_ = refl

