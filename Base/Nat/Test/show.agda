module Base.Nat.Test.show where

open import Base.Nat.Nat
open import Base.Nat.show
open import Base.String.String
open import Base.Equal.Equal

test-show-regular : show 42 ≡ "42"
test-show-regular = refl

test-show-zero : show 0 ≡ "0"
test-show-zero = refl

test-show-large : show 1000 ≡ "1000"
test-show-large = refl
