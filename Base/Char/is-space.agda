module Base.Char.is-space where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primIsSpace : Char → Bool

-- Determines if a character is a whitespace character.
-- 1st: The character to check.
-- = True if the character is a whitespace character, False otherwise.
is-space : Char → Bool
is-space = primIsSpace