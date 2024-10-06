module Base.Bool.or where

open import Base.Bool.Bool

-- Performs logical OR operation on two boolean values.
-- - 1st: The boolean value.
-- - 2nd: The boolean value.
-- = True if either 1st or 2nd (or both) are true.
or : Bool → Bool → Bool
or True  _ = True
or False b = b

-- Infix operator for or bitwise operator.
_||_ : Bool → Bool → Bool
_||_ = or

infixr 5 _||_
