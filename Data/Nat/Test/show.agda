module Data.Nat.Test.show where

open import Data.Nat.Type
open import Data.Nat.show
open import Data.String.Type
open import Data.Trait.Show
open import Data.Equal.Type

-- Show tests
_ : show 42 === "42"
_ = refl

_ : show 0 === "0"
_ = refl

_ : show 1000 === "1000"
_ = refl
