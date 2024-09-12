module Data.Vector.Test.show where

open import Data.Vector.Type
open import Data.Vector.show
open import Data.Nat.Type
open import Data.Nat.show
open import Data.String.Type
open import Data.Equal.Type

test-show-empty-vector-nat : show ([] {A = Nat}) === "<>"
test-show-empty-vector-nat = refl

test-show-non-empty-vector : show (1 :: 2 :: 3 :: []) === "<1, 2, 3>"
test-show-non-empty-vector = refl

test-show-empty-vector : show [] === "<>"
test-show-empty-vector = refl