module Base.F64.mod where

open import Base.F64.div
open import Base.F64.mul
open import Base.F64.sub
open import Base.F64.F64

-- Computes the remainder of the division of x by y.
-- - x: The dividend.
-- - y: The divisor.
-- = The remainder of x/y.
mod : F64 -> F64 -> F64
mod x y = sub x (mul (div x y) y)

-- Infix version of mod
infix 7 _%_
_%_ : F64 -> F64 -> F64
_%_ = mod
