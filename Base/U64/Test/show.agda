module Base.U64.Test.show where

open import Base.U64.U64
open import Base.U64.show
open import Base.String.String
open import Base.Equal.Equal

test-show-positive : show (primWord64FromNat 42) ≡ "42U"
test-show-positive = refl

test-show-zero : show (primWord64FromNat 0) ≡ "0U"
test-show-zero = refl
