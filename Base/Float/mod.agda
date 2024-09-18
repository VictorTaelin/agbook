module Base.Float.mod where

open import Base.Float.div
open import Base.Float.mul
open import Base.Float.sub
open import Base.Float.Type

-- Computes the remainder of the division of x by y.
-- - x: The dividend.
-- - y: The divisor.
-- = The remainder of x/y.
mod : Float → Float → Float
mod x y = sub x (mul (div x y) y)

-- Infix version of mod
infix 7 _%_
_%_ : Float → Float → Float
_%_ = mod
