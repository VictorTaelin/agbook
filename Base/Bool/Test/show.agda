module Base.Bool.Test.show where

open import Base.Bool.Type
open import Base.Bool.show
open import Base.String.Type
open import Base.Equal.Type

test-show-true : show True === "true"
test-show-true = refl

test-show-false : show False === "false"
test-show-false = refl
