module Base.Bool.not where

open import Base.Bool.Bool

-- Negates a Boolean value.
-- - b: The input Boolean value.
-- = The negation of the input.
not : Bool -> Bool
not True  = False
not False = True

!_ : Bool -> Bool
!_ = not

infix 8 !_
