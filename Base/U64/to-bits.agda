module Base.U64.to-bits where

open import Base.U64.U64
open import Base.Bits.Bits
open import Base.Nat.Nat
open import Base.Nat.to-bits renaming (to-bits to to-bits-nat) 
open import Base.U64.to-nat

-- Converts a U64 number to its binary representation.
-- - n: The U64 number to convert.
-- = The binary representation of the number as Bits.
to-bits : U64 → Bits
to-bits n = to-bits-nat (to-nat n)

