module Base.Bits.xor where

open import Base.Bits.Bits

-- Performs bitwise XOR operation on two Bits values.
-- - a: The 1st Bits value.
-- - b: The 2nd Bits value.
-- = A new Bits value representing the bitwise XOR of a and b.
xor : Bits → Bits → Bits
xor E     E     = E
xor E     b     = b
xor a     E     = a
xor (O a) (O b) = O (xor a b)
xor (O a) (I b) = I (xor a b)
xor (I a) (O b) = I (xor a b)
xor (I a) (I b) = O (xor a b)

-- Infix operator for bitwise XOR
_^_ : Bits → Bits → Bits
_^_ = xor

infixr 5 _^_

