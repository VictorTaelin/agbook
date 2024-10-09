module Base.Char.eq where

open import Base.Char.Char
open import Base.Bool.Bool

primitive primCharEquality : Char → Char → Bool

-- Compares two characters for equality.
-- 1st: The character to compare.
-- 2nd: The character to compare.
-- = True if the characters are equal, False otherwise.
eq : Char → Char → Bool
eq = primCharEquality

-- Infix operator for character equality.
_==_ : Char → Char → Bool
_==_ = eq

infix 4 _==_

