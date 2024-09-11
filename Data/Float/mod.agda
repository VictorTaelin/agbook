module Data.Float.mod where

open import Data.Float.Type

-- computes the remainder of the division of x by y.
-- - x: The dividend.
-- - y: The divisor.
-- = The remainder of x/y.
mod : Float → Float → Float
mod x y = primFloatMinus x (primFloatTimes (primFloatDiv x y) y)

-- Infix version of mod
infix 7 _%_
_%_ : Float → Float → Float
_%_ = mod