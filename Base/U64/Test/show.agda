module Base.U64.Test.show where

open import Base.U64.Type
open import Base.U64.show
open import Base.String.Type
open import Base.Equal.Type

test-show-positive : show (primWord64FromNat 42) ≡ "42U"
test-show-positive = refl

test-show-zero : show (primWord64FromNat 0) ≡ "0U"
test-show-zero = refl
