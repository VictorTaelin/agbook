module Base.String.split-at where

open import Base.List.split-at renaming (split-at to split-at')
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.from-list
open import Base.String.to-list

-- Splits a string at the given index.
-- - 1st: The index at which to split the string.
-- - 2nd: The input string.
-- = A pair of strings, where the first string contains the characters before the index,
--   and the second string contains the characters from the index onwards.
split-at : Nat -> String -> Pair String String
split-at n s = do
  let chars       = to-list s
  let (fst , snd) = split-at' n chars
  (from-list fst , from-list snd)