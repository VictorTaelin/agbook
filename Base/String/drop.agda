module Base.String.drop where

open import Base.Function.case
open import Base.List.Type
open import Base.Nat.Type
open import Base.String.Type
open import Base.String.from-list
open import Base.String.to-list

-- Drops the first n characters from a string.
-- - 1st: The number of characters to drop.
-- - 2nd: The input string.
-- = A new string with the first n characters removed, or an empty string if n is greater than or equal to the string length.
drop : Nat -> String -> String
drop Zero s = s
drop (Succ n) s = case to-list s of λ where
  []        -> ""
  (_ :: xs) -> drop n (from-list xs)
