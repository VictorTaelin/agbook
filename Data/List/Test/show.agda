module Data.List.Test.show where

open import Data.List.Type
open import Data.List.show
open import Data.Nat.Type
open import Data.Nat.show
open import Data.String.Type
open import Data.Equal.Type

-- Show tests
_ : show (1 :: 2 :: 3 :: []) === "[1, 2, 3]"
_ = refl

_ : show ([] {A = Nat}) === "[]"
_ = refl

_ : show [] === "[]"
_ = refl