module Base.Float.Test.show where

open import Base.Float.Type
open import Base.Float.show
open import Base.Float.Operations
open import Base.String.Type
open import Base.Equal.Type

test-show-pi : show 3.14 === "3.14"
test-show-pi = refl

test-show-zero : show 0.0 === "0.0"
test-show-zero = refl

test-show-negative : show -2.5 === "-2.5"
test-show-negative = refl

-- NaN and Infinity tests (if supported)
-- Uncomment these if your Float implementation supports NaN and Infinity

test-show-infinity : show (1.0 f/ 0.0) === "Infinity"
test-show-infinity = refl

test-show-negative-infinity : show (-1.0 f/ 0.0) === "-Infinity"
test-show-negative-infinity = refl

test-show-nan : show (0.0 f/ 0.0) === "NaN"
test-show-nan = refl
