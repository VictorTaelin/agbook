module Base.Char.is-digit where

open import Base.Char.Char
open import Base.Bool.Bool

primitive primIsDigit : Char → Bool

-- Checks if a character is a digit (0-9).
-- 1st: The character to check.
-- = True if the character is a digit, False otherwise.
is-digit : Char → Bool
is-digit = primIsDigit