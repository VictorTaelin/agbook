module Data.Bit.or where

open import Data.Bit.Type

-- Performs logical OR operation on two bits.
-- - a: The 1st bit.
-- - b: The 2nd bit.
-- = True if either a or b is true.
or : Bit → Bit → Bit
or True  _ = True
or False b = b

_||_ : Bit → Bit → Bit
_||_ = or

infixr 5 _||_
