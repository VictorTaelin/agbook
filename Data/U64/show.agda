module Data.U64.show where

open import Data.U64.Type
open import Data.Nat.Type
open import Data.String.Type
open import Data.String.append
open import Data.Nat.show renaming (show to nshow)

-- Converts a U64 number to its string representation.
-- - x: The U64 number to be converted.
-- = A string representation of the U64 number with a "U" suffix.
show : U64 → String

show x = nshow (primWord64ToNat x) ++ "U"