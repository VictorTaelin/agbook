module Base.Bool.or where

open import Base.Bool.Type

-- Performs logical OR operation on two bools.
-- - a: The 1st bool.
-- - b: The 2nd bool.
-- = True if either a or b is true.
or : Bool → Bool → Bool
or True  _ = True
or False b = b

_||_ : Bool → Bool → Bool
_||_ = or

infixr 5 _||_
