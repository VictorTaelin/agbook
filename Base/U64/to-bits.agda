module Base.U64.to-bits where

open import Base.U64.Type
open import Base.Bits.Type
open import Base.Nat.Type
open import Base.Nat.to-bits renaming (to-bits to to-bits-nat) 
open import Base.U64.from-nat

-- Converts a U64 number to its binary representation.
-- - n: The U64 number to convert.
-- = The binary representation of the number as Bits.
to-bits : U64 → Bits
to-bits n = to-bits-nat (primWord64ToNat n)
