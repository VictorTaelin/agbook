module Base.Bool.and where

open import Base.Bool.Bool

-- Performs logical AND operation on two boolean values.
-- - a: The 1st boolean value.
-- - b: The 2nd boolean value.
-- = True if both a and b are true.
and : Bool → Bool → Bool
and True  b = b
and False b = False

_&&_ : Bool → Bool → Bool
_&&_ = and

infixr 6 _&&_
