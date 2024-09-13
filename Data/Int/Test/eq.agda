module Data.Int.Test.eq where

open import Data.Int.eq
open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Bool.Type


test0 : (+ 0 == + 0) === True
test0 = refl

test1 : (+ 0 == + 1) === False
test1 = refl

test2 : ∀ {n} → ((Neg n) == (Pos n)) === False
test2 {Zero} = refl
test2 {Succ n} = refl
