module Base.U64.Test.eq where

open import Base.U64.U64
open import Base.U64.eq
open import Base.Bool.Bool
open import Base.Equal.Equal

test-eq-same-value : ((primWord64FromNat 42) == (primWord64FromNat 42)) ≡ True
test-eq-same-value = refl

test-eq-different-values : ((primWord64FromNat 42) == (primWord64FromNat 43)) ≡ False
test-eq-different-values = refl

test-neq-same-value : ((primWord64FromNat 64) != (primWord64FromNat 64)) ≡ False
test-neq-same-value = refl

test-neq-different-values : ((primWord64FromNat 64) != (primWord64FromNat 65)) ≡ True
test-neq-different-values = refl

