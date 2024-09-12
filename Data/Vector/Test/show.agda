module Data.Vector.Test.show where

open import Data.Vector.Type
open import Data.Vector.show
open import Data.Nat.Type
open import Data.Nat.show
open import Data.String.Type
open import Data.Trait.Show
open import Data.Equal.Type

-- Show tests
_ : show ([] {A = Nat}) ≡ "<>"
_ = refl

_ : show (1 :: 2 :: 3 :: []) === "<1, 2, 3>"
_ = refl

_ : show [] === "<>"
_ = refl