module Base.Char.to-nat where

open import Base.Char.Char
open import Base.Nat.Nat

primitive
  primCharToNat : Char → Nat

-- Converts a character to its corresponding natural number representation.
-- 1st: The input character.
-- = The natural number representation of the character.
to-nat : Char → Nat
to-nat = primCharToNat