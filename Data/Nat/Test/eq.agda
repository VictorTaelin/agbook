module Data.Nat.Test.eq where

open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Trait.Eq
open import Data.Equal.Type

-- Eq tests
_ : (42 == 42) === true
_ = refl

_ : (42 == 43) === false
_ = refl

_ : (0 == 0) === true
_ = refl

_ : (4 != 4) === False
_ = refl
