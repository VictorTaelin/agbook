module Base.F64.and where

import Base.Bool.and as Bool
open import Base.Bool.Bool
open import Base.Bool.not
open import Base.F64.F64
open import Base.F64.eq

-- Performs logical AND on two floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = true if both x and y are true.
and : F64 -> F64 -> Bool
and x y = Bool.and (not (eq 0.0 x)) (not (eq 0.0 y))

-- The infix version of and.
infixl 6 _&&_
_&&_ : F64 -> F64 -> Bool
_&&_ = and
