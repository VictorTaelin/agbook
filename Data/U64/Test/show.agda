module Data.U64.Test.show where

open import Data.U64.Type
open import Data.U64.show
open import Data.String.Type
open import Data.Equal.Type

test-show-positive : show (primWord64FromNat 42) === "42U"
test-show-positive = refl

test-show-zero : show (primWord64FromNat 0) === "0U"
test-show-zero = refl
