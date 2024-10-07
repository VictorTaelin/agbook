module Base.Char.is-print where

open import Base.Char.Char
open import Base.Bool.Bool

primitive primIsPrint : Char → Bool

-- Checks if a character is printable.
-- 1st: The character to check.
-- = True if the character is printable, False otherwise.
is-print : Char → Bool
is-print = primIsPrint