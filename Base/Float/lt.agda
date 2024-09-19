module Base.Float.lt where

open import Base.Bool.Type
open import Base.Float.Type

-- Less-than comparison for floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = True if x is less than y.
lt : Float → Float → Bool
lt = primFloatLess

-- infix version of lt
infix 4 _<_
_<_ : Float → Float → Bool
_<_ = lt
