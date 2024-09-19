module Base.String.drop where

open import Base.Nat.Type
open import Base.String.Type
open import Base.String.to-list
open import Base.String.from-list
open import Base.List.Type
open import Base.Function.case

-- Drops the first n characters from a string.
-- If n is greater than or equal to the length of the string, returns an empty string.
-- - n: The number of characters to drop.
-- - s: The input string.
-- = The string with the first n characters removed.
drop : Nat → String → String
drop Zero s = s
drop (Succ n) s = case to-list s of λ where
  [] → ""
  (_ :: xs) → drop n (from-list xs)
