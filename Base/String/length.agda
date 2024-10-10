module Base.String.length where

open import Base.String.String
open import Base.String.to-list
open import Base.List.length renaming (length to length')
open import Base.Nat.Nat

-- Computes the length of a string.
-- - 1st: The input string.
-- = The number of characters in the string.
length : String → Nat
length s = length' (to-list s)

