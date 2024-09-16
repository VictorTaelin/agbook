module Data.Bit.xor where

open import Data.Bit.Type
open import Data.Bit.not

-- Performs logical XOR operation on two bits.
-- - a: The 1st bit.
-- - b: The 2nd bit.
-- = True if a and b are different.
xor : Bit → Bit → Bit
xor True  b = not b
xor False b = b

_^_ : Bit → Bit → Bit
_^_ = xor

infixr 7 _^_
