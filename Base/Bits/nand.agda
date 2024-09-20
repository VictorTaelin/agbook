module Base.Bits.nand where

open import Base.Bits.Type
open import Base.Bits.and
open import Base.Bits.not

-- Performs bitwise NAND operation on two Bits values.
-- - a: The 1st Bits value.
-- - b: The 2nd Bits value.
-- = A new Bits value representing the bitwise NAND of a and b.
nand : Bits → Bits → Bits
nand a b = not (and a b)

-- Infix operator for bitwise NAND
_!&_ : Bits → Bits → Bits
_!&_ = nand

infixr 6 _!&_
