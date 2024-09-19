module Base.U64.show where

open import Base.U64.Type
open import Base.String.Type
open import Base.String.append
open import Base.Nat.show
open import Base.Trait.Show public

-- Converts a U64 number to its string representation.
-- - x: The U64 number to be converted.
-- = A string representation of the U64 number with a "U" suffix.
instance
  ShowU64 : Show U64
  ShowU64 = record { to-string = λ x → show (primWord64ToNat x)  ++ "U" }