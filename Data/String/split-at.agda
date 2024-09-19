module Data.String.split-at where

open import Data.String.Type
open import Data.String.to-list
open import Data.String.from-list
open import Data.List.split-at renaming (split-at to split-at')
open import Data.Nat.Type
open import Data.Pair.Type

-- Splits a string at the given index.
-- - n: The index at which to split the string.
-- - s: The input string.
-- = A pair of strings, where the first string contains the characters before the index,
--   and the second string contains the characters from the index onwards.
split-at : Nat → String → Pair String String
split-at n s = do
  let chars = to-list s
  let (fst , snd) = split-at' n chars
  (from-list fst , from-list snd)
