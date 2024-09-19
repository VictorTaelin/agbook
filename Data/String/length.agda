module Data.String.length where

open import Data.String.Type
open import Data.String.to-list
open import Data.List.length renaming (length to length')
open import Data.Nat.Type

-- Computes the length of a string.
-- - s: The input string.
-- = The number of characters in the string.
length : String → Nat
length s = length' (to-list s)
