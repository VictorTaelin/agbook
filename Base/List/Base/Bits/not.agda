module Base.Bits.not where

open import Base.Bits.Type

-- Performs bitwise NOT operation on a Bits value.
-- - a: The input Bits value.
-- = A new Bits value representing the bitwise NOT of a.
not : Bits → Bits
not E     = E
not (O a) = I (not a)
not (I a) = O (not a)

-- Prefix operator for bitwise NOT
~_ : Bits → Bits
~_ = not

prefix 5 ~_