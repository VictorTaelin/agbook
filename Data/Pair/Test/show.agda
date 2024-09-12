module Data.Pair.Test.show where

open import Data.Pair.Type
open import Data.Pair.show
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Bool.Type
open import Data.Bool.show
open import Data.String.Type
open import Data.Equal.Type

-- Show tests
_ : show (1 , True) === "(1, true)"
_ = refl

_ : show (42 , False) === "(42, false)"
_ = refl

_ : show (1 , 1) === "(1, 1)"
_ = refl