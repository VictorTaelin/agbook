module Data.Nat.Test.show where

open import Data.Nat.Type
open import Data.Nat.show
open import Data.String.Type
open import Data.Equal.Type

test-show-regular : show 42 === "42"
test-show-regular = refl

test-show-zero : show 0 === "0"
test-show-zero = refl

test-show-large : show 1000 === "1000"
test-show-large = refl
