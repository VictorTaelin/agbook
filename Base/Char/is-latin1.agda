module Base.Char.is-latin1 where

open import Base.Char.Char
open import Base.Bool.Bool

primitive primIsLatin1 : Char → Bool

-- Checks if a character is within the Latin-1 character set.
-- 1st: The character to check.
-- = True if the character is in the Latin-1 set, False otherwise.
is-latin1 : Char → Bool
is-latin1 = primIsLatin1

