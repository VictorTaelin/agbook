module Data.U64.show where

open import Data.U64.Type
open import Data.String.Type
open import Data.String.append
open import Data.Nat.show
open import Data.Trait.Show public

-- Converts a U64 number to its string representation.
-- - x: The U64 number to be converted.
-- = A string representation of the U64 number with a "U" suffix.
instance
  ShowU64 : Show U64
  ShowU64 = record { to-string = λ x → show (primWord64ToNat x)  ++ "U" }