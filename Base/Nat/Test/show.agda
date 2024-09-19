module Base.Nat.Test.show where

open import Base.Nat.Type
open import Base.Nat.show
open import Base.String.Type
open import Base.Equal.Type

test-show-regular : show 42 === "42"
test-show-regular = refl

test-show-zero : show 0 === "0"
test-show-zero = refl

test-show-large : show 1000 === "1000"
test-show-large = refl
