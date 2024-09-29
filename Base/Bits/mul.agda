module Base.Bits.mul where

open import Base.Bits.Bits
open import Base.Bits.add

-- Performs multiplication of two Bits values.
-- - a: The 1st Bits value.
-- - b: The 2nd Bits value.
-- = A new Bits value representing the product of a and b.
mul : Bits → Bits → Bits
mul E     _ = E
mul _     E = E
mul (O a) b = O (mul a b)
mul (I a) b = add b (O (mul a b))

-- Infix operator for Bits multiplication
_*_ : Bits → Bits → Bits
_*_ = mul

infixl 7 _*_
