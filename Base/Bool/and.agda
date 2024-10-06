module Base.Bool.and where

open import Base.Bool.Bool

-- Performs logical AND operation on two boolean values.
-- - 1st: The boolean value.
-- - 2nd: The boolean value.
-- = True if both 1st and 2nd are true.
and : Bool → Bool → Bool
and True  b = b
and False b = False

-- Infix operator for and bitwise operator.
_&&_ : Bool → Bool → Bool
_&&_ = and

infixr 6 _&&_
