module Data.U64.to-bits where

open import Data.U64.Type
open import Data.Bits.Type
open import Data.Nat.Type
open import Data.Nat.to-bits renaming (to-bits to to-bits-nat) 
open import Data.U64.from-nat

-- Converts a U64 number to its binary representation.
-- - n: The U64 number to convert.
-- = The binary representation of the number as Bits.
to-bits : U64 → Bits
to-bits n = to-bits-nat (primWord64ToNat n)
