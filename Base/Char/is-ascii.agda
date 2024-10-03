module Base.Char.is-ascii where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primIsAscii : Char → Bool

-- Determines if a character is an ASCII character.
-- 1st: The character to check.
-- = True if the character is an ASCII character, False otherwise.
is-ascii : Char → Bool
is-ascii = primIsAscii