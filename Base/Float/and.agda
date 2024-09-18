module Base.Float.and where

import Base.Bool.and as Bool
open import Base.Bool.not
open import Base.Bool.Type
open import Base.Float.Type

-- Performs logical AND on two floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = true if both x and y are true.
and : Float → Float → Bool
and x y = Bool.and (not (primFloatEquality 0.0 x)) (not (primFloatEquality 0.0 y))

-- The infix version of and.
infixl 6 _&&_
_&&_ : Float → Float → Bool
_&&_ = and
