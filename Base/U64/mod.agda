module Base.U64.mod where

open import Base.U64.Type
open import Base.U64.div
open import Base.U64.mul
open import Base.U64.sub

-- Modulo operation for two U64 numbers.
-- - a: The dividend (U64 number).
-- - b: The divisor (U64 number).
-- = The remainder of a divided by b as a U64 number.
mod : U64 -> U64 -> U64
mod a b = sub a (mul b (div a b))

infixl 7 _mod_
-- Infix operator for U64 modulo operation.
-- - Equivalent to the 'mod' function.
_mod_ : U64 -> U64 -> U64
_mod_ = mod
