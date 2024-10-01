module Bend.Parser.Fun.Test.parse-fn-def where

open import Base.Function.case
open import Base.Equal.Equal
open import Base.String.String
open import Base.Maybe.Maybe
open import Base.Result.Result
open import Base.List.List
open import Base.Pair.Pair
open import Base.Nat.Nat
open import Base.Bool.Bool
open import Base.Trait.Show
open import Bend.Fun.Op.Op
open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.Rule.Rule
open import Bend.Fun.Term.Term
open import Bend.Fun.Term.show
open import Bend.Fun.Term.Term
open import Bend.Fun.Type.Type
open import Bend.Fun.dsl
open import Bend.Source.Source
import Bend.Fun.FnDef.show as FDShow'

open import Base.Parser.Parser
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Error
open import Bend.Parser.Fun.parse-fn-def

private
  open module FDShow = FDShow' ShowTerm


parse : String → Result (Reply String) Error
parse input = case parse-fn-def (MkState input 0) of λ where
  (Done (MkReply state def)) → Done (MkReply state (show def))
  (Fail e) → Fail e

ok : String → Nat → String → Result (Reply String) Error
ok input index expected = Done (MkReply (MkState input index) expected)

-- Simple function definition
_ : parse "f x = x" ≡
    ok "" 7 "unchecked f : Any\n(f x) = x"
_ = refl

-- Function with explicit type signature
_ : parse "f (x: u24) : u24 = (+ x 1)" ≡
    ok "" 26 "f : (u24 -> u24)\n(f x) = (+ x 1)"
_ = refl

-- Function with multiple arguments
_ : parse "add x y = (+ x y)" ≡
    ok "" 17 "unchecked add : Any\n(add x y) = (+ x y)"
_ = refl

-- Function with multiple rules
_ : parse "fib 0 = 0\nfib 1 = 1\nfib n = (+ (fib (- n 1)) (fib (- n 2)))" ≡
    ok "" 59 "unchecked fib : Any\n(fib 0) = 0\n(fib 1) = 1\n(fib n) = (+ (fib (- n 1)) (fib (- n 2)))"
_ = refl

-- Unchecked function
_ : parse "unchecked f x = x" ≡
    ok "" 17 "unchecked f : Any\n(f x) = x"
_ = refl

-- Checked function
_ : parse "checked f x = x" ≡
    ok "" 15 "f : Any\n(f x) = x"
_ = refl

-- Function with complex pattern matching
_ : parse "head (Cons x xs) = x\nhead Nil = (error \"Empty list\")" ≡
    ok "" 52 "unchecked head : Any\n(head (Cons x xs)) = x\n(head Nil) = (error \"Empty list\")"
_ = refl

-- Invalid function definition (missing '=')
-- TODO: Improve error message
_ : parse "f x x" ≡ Fail (MkError 5 "Expected pattern")
_ = refl

-- Invalid function definition (empty body)
_ : parse "f x =" ≡ Fail (MkError 5 "Expected term")
_ = refl
