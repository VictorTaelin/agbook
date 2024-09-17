module Data.Bit.nand where

open import Data.Bit.Type
open import Data.Bit.not
open import Data.Bit.and

-- Performs logical NAND operation on two bits.
-- - a: The 1st bit.
-- - b: The 2nd bit.
-- = True if at least one of a or b is false.
nand : Bit → Bit → Bit
nand a b = not (a && b)

_⊼_ : Bit → Bit → Bit
_⊼_ = nand

infixr 6 _⊼_