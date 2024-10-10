module Base.Nat.to-u64 where

open import Base.Nat.Nat
open import Base.U64.U64

primitive primWord64FromNat : Nat → U64

-- Converts a natural number to a 64-bit unsigned integer.
-- 1st: The natural number to convert.
-- = The U64 representation of the input natural number.
to-u64 : Nat → U64
to-u64 = primWord64FromNat

