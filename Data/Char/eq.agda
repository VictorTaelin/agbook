module Data.Char.eq where

open import Data.Char.Type
open import Data.Bool.Type

primitive
  primCharEquality : Char → Char → Bool

-- Checks if two characters are equal.
-- - c1: The first character.
-- - c2: The second character.
-- = True if c1 and c2 are the same character, False otherwise.
eq : Char → Char → Bool
eq = primCharEquality

-- Infix operator for character equality
_==_ : Char → Char → Bool
_==_ = eq

infix 4 _==_
