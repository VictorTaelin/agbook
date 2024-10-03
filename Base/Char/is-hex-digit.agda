module Base.Char.is-hex-digit where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primIsHexDigit : Char → Bool

-- Checks if a character is a hexadecimal digit (0-9, A-F, a-f).
-- 1st: The character to check.
-- = True if the character is a hexadecimal digit, False otherwise.
is-hex-digit : Char → Bool
is-hex-digit = primIsHexDigit