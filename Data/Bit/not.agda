module Data.Bit.not where

open import Data.Bit.Type

-- Negates a Boolean value.
-- - b: The input Boolean value.
-- = The negation of the input.
not : Bit → Bit
not True  = False
not False = True

!_ : Bit → Bit
!_ = not

infix 8 !_
