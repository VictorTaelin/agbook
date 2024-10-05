module Base.Char.is-binary-digit where

open import Base.Nat.Nat
open import Base.Char.Char
open import Base.Char.eq
open import Base.Bool.Bool
open import Base.Bool.or

-- Checks if the character is a valid binary digit (0 or 1).
-- 1st: The character to check.
-- = True if the character is a binary digit, False otherwise.
is-binary-digit : Char → Bool
is-binary-digit c = (c == '0') || (c == '1')
