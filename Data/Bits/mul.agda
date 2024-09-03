module Data.Bits.mul where

open import Data.Bits.Type
open import Data.Bits.add
open import Data.Bits.and

-- Performs multiplication of two Bits values.
-- - a: The first Bits value.
-- - b: The second Bits value.
-- = A new Bits value representing the product of a and b.
mul : Bits → Bits → Bits
mul E        _        = E
mul _        E        = E
mul (O a)    b        = O (mul a b)
mul (I a)    b        = b + (O (mul a b))

-- Infix operator for Bits multiplication
_*_ : Bits → Bits → Bits
_*_ = mul

infixl 7 _*_
