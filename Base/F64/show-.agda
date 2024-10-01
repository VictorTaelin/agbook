module Base.F64.show- where

open import Base.F64.F64
open import Base.F64.show
open import Base.F64.div
open import Base.String.String
open import Base.Equal.Equal

test-show-pi : show 3.14 ≡ "3.14"
test-show-pi = refl

test-show-zero : show 0.0 ≡ "0.0"
test-show-zero = refl

test-show-negative : show -2.5 ≡ "-2.5"
test-show-negative = refl

-- NaN and Infinity tests (if supported)
-- Uncomment these if your F64 implementation supports NaN and Infinity

test-show-infinity : show (1.0 / 0.0) ≡ "Infinity"
test-show-infinity = refl

test-show-negative-infinity : show (-1.0 / 0.0) ≡ "-Infinity"
test-show-negative-infinity = refl

test-show-nan : show (0.0 / 0.0) ≡ "NaN"
test-show-nan = refl
