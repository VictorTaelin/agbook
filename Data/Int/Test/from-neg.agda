module Data.Int.Test.from-neg where

open import Data.Int.Type
open import Data.Int.from-neg
open import Data.Nat.Type
open import Data.Equal.Type

_ : from-neg Zero === Pos Zero
_ = refl

_ : -2 === NegSuc (Succ Zero)
_ = refl

_ : -2 === from-neg 2
_ = refl

test : (n : Nat) -> (from-neg (Succ n) === NegSuc n)
test p = refl
