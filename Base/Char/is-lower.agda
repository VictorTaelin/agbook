module Base.Char.is-lower where

open import Base.Char.Char
open import Base.Bool.Bool

primitive primIsLower : Char → Bool

-- Checks if a character is a lowercase letter.
-- 1st: The character to check.
-- = True if the character is lowercase, False otherwise.
is-lower : Char → Bool
is-lower = primIsLower

