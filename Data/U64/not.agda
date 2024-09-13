module Data.U64.not where

open import Data.U64.Type
open import Data.U64.from-nat
open import Data.Bits.Type
open import Data.Bits.from-nat renaming (from-nat to bits-from-nat)
open import Data.Bits.not
open import Data.Nat.Type

-- Performs bitwise NOT operation on a U64 value.
-- - x: The U64 value to be negated.
-- = The result of bitwise NOT on x.
notU64 : U64 → Bits
notU64 x = not (bits-from-nat (primWord64ToNat x))

