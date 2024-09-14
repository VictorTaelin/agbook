module Data.Int.Test.eq where

open import Data.Int.eq
open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Bool.Type


eq0 : (+ 0 == + 0) === True
eq0 = refl

eq1 : (+ 0 == + 1) === False
eq1 = refl

eq2 : ∀ {n} → ((Neg n) == (Pos n)) === False
eq2 {Zero} = refl
eq2 {Succ n} = refl
