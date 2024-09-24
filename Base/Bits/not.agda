module Base.Bits.not where

open import Base.Bits.Type

-- Performs bitwise NOT operation on a Bits value.
-- - bits: The input Bits value.
-- = A new Bits value representing the bitwise NOT of the input.
not : Bits -> Bits
not E        = E
not (O bits) = I (not bits)
not (I bits) = O (not bits)

-- Prefix operator for bitwise NOT
~_ : Bits -> Bits
~_ = not

infix 9 ~_

