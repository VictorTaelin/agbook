module Bend.Transform.linearize-vars- where

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
open import Base.BinMap.empty
open import Base.Pair.Pair
open import Bend.Parser.Fun.parse-term
open import Bend.Transform.linearize-vars
open import Bend.Fun.Num.Num
open import Bend.Fun.Type.Type
open import Bend.Fun.Term.Term renaming (Num to Num')
open import Bend.Fun.Term.show
open import Bend.Fun.Book.Book
open import Bend.Fun.dsl

parse : String → Result (Reply Term) Error
parse input = parse-term (new-parser-state input)

test-linearize-vars : String → Term
test-linearize-vars input =
  case parse input of λ where
    (Done (MkReply _ parsed-term)) → snd (linearize-vars-term empty parsed-term)
    _ → Era

-- Simple variable reference (no change expected)
_ : (test-linearize-vars "x") ≡ v' "x"
_ = refl

-- Lambda with single use of variable (no change expected)
_ : test-linearize-vars "λx x" ≡ λ' (p' "x") (v' "x")
_ = refl

-- Lambda with multiple uses of variable (should be linearized)
_ : test-linearize-vars "λx (x x)" ≡
    λ' (p' "x") (let' (p'dup (p' "x" :: p' "x_2" :: [])) := (v' "x") in'
                ((v' "x") $ (v' "x_2")))
_ = refl

-- Let binding with single use (no change expected)
_ : test-linearize-vars "let x = 1; x" ≡ #u 1
_ = refl

-- Let binding with multiple uses (should be linearized)
_ : test-linearize-vars "let x = 1; (x x)" ≡
      (let' (p'dup (p' "x" :: p' "x_2" :: [])) := (#u 1) in'
      ((v' "x") $ (v' "x_2")))
_ = refl

-- Nested lambdas with multiple uses (should be linearized)
_ : test-linearize-vars "λx λy (x y x)" ≡
    λ' (p' "x") (let' (p'dup (p' "x" :: p' "x_2" :: [])) := (v' "x") in' (λ' (p' "y")
       ((v' "x") $ (v' "y") $ (v' "x_2"))))
_ = refl

-- Multiple let bindings with mixed usage
_ : test-linearize-vars "let x = 1; let y = 2; (x y x)" ≡
    (let' (p'dup (p' "x" :: p' "x_2" :: [])) := (#u 1) in'
     ((v' "x") $ (#u 2) $ (v' "x_2")))
_ = refl

-- Unused variable should be erased
_ : test-linearize-vars "let x = 1; 2" ≡ (let' p'* := (#u 1) in' (#u 2))
_ = refl

-- Complex expression with multiple variables and uses
_ : test-linearize-vars "λx λy (let z = x; (x y z x))" ≡
    λ' (p' "x") (let' (p'dup (p' "x" :: p' "x_2" :: p' "x_3" :: [])) := (v' "x") in'
      (λ' (p' "y") ((v' "x") $ (v' "y") $ (v' "x_3") $ (v' "x_2"))))
_ = refl

