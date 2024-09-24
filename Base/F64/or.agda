module Base.F64.or where

open import Base.Bool.not
import Base.Bool.or as Bool
open import Base.Bool.Type
open import Base.F64.Type
open import Base.F64.eq

-- Performs a logical OR on two floats.
-- - x: the 1st float.
-- - y: the 2nd float.
-- = True if either x or y (or both) are non-zero, False otherwise.
or : F64 -> F64 -> Bool
or x y = Bool.or (not (eq 0.0 x)) (not (eq 0.0 y))

infixl 5 _||_
_||_ : F64 -> F64 -> Bool
_||_ = or
