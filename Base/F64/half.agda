module Base.F64.half where

open import Base.F64.F64
open import Base.F64.div

-- Halves the given float.
-- - x: The number to half.
-- = The result of x/2.
half : F64 -> F64
half x = div x 2.0
