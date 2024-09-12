module Data.Bool.Test.show where

open import Data.Bool.Type
open import Data.Bool.show
open import Data.String.Type
open import Data.Equal.Type

test-show-true : show True === "true"
test-show-true = refl

test-show-false : show False === "false"
test-show-false = refl
