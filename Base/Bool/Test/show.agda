module Base.Bool.Test.show where

open import Base.Bool.Bool
open import Base.Bool.show
open import Base.String.String
open import Base.Equal.Equal

test-show-true : show True ≡ "true"
test-show-true = refl

test-show-false : show False ≡ "false"
test-show-false = refl
