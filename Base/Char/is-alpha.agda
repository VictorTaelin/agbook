module Base.Char.is-alpha where

open import Base.Char.Char
open import Base.Bool.Bool

primitive primIsAlpha : Char → Bool

-- Checks if a character is alphabetic.
-- 1st: The character to check.
-- = True if the character is alphabetic, False otherwise.
is-alpha : Char → Bool
is-alpha = primIsAlpha

