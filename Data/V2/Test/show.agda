module Data.V2.Test.show where

open import Data.V2.Type
open import Data.V2.show
open import Data.Float.Type
open import Data.Float.show
open import Data.String.Type
open import Data.Equal.Type

test-show-positive : show (MkV2 1.0 2.0) === "V2(1.0, 2.0)"
test-show-positive = refl

test-show-zero : show (MkV2 0.0 0.0) === "V2(0.0, 0.0)"
test-show-zero = refl

test-show-positive-duplicate : show (MkV2 1.0 2.0) === "V2(1.0, 2.0)"
test-show-positive-duplicate = refl

test-show-zero-duplicate : show (MkV2 0.0 0.0) === "V2(0.0, 0.0)"
test-show-zero-duplicate = refl
