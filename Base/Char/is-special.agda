module Base.Char.is-special where

open import Base.Char.Char
open import Base.Char.is-alpha
open import Base.Char.is-digit
open import Base.Char.is-print
open import Base.Bool.Bool
open import Base.Bool.or
open import Base.Bool.and
open import Base.Bool.not
open import Base.Equal.Equal

-- Checks if a character is a special character (printable but not alphanumeric).
-- - c: The character to check.
-- = True if the character is a special character, False otherwise.
is-special : Char → Bool
is-special c = is-print c && (! (is-alpha c || is-digit c))
