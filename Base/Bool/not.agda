module Base.Bool.not where

open import Base.Bool.Bool

-- Performs logical NOT operation on a boolean value.
-- - 1st: The boolean value to negate.
-- = True if 1st is False, False if 1st is True.
not : Bool → Bool
not True  = False
not False = True

-- Prefix operator for logical NOT.
!_ : Bool → Bool
!_ = not

infix 8 !_
