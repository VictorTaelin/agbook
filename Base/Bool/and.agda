module Base.Bool.and where

open import Base.Bool.Bool

-- Performs logical AND operation on two boolean values.
-- - a: The first boolean value.
-- - b: The second boolean value.
-- = True if both a and b are true.
and : Bool -> Bool -> Bool
and True  b = b
and False b = False

_&&_ : Bool -> Bool -> Bool
_&&_ = and

infixr 6 _&&_
