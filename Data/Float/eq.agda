module Data.Float.eq where

open import Data.Float.Type
open import Data.Bool.Type

-- Checks if two floats are equal.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = True if x and y are equal.
eq : Float → Float → Bool
eq = primFloatEquality

-- infix version of eq
infix 4 _==_
_==_ : Float → Float → Bool
_==_ = eq
