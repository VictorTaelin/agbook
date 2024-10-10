module Base.Char.to-digit where

open import Base.Nat.Nat
open import Base.Char.Char
open import Base.Maybe.Maybe
open import Base.Char.is-digit
open import Base.Char.is-hex-digit
open import Base.Char.is-binary-digit
open import Base.Char.is-octal-digit
open import Base.Char.digit-to-nat
open import Base.Char.hex-to-nat
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Nat.eq
open import Base.Bool.and

-- Converts a single character to its numeric value in the given base.
-- 1st: The base (e.g., 2 for binary, 8 for octal, 10 for decimal, 16 for hexadecimal).
-- 2nd: The character to convert.
-- = Some n if the character is a valid digit in the given base, where n is the corresponding numeric value, None if the character is not a valid digit in the given base.
to-digit : Nat → Char → Maybe Nat
to-digit base c = 
  if (base == 2) && is-binary-digit c then
    digit-to-nat c
  else if (base == 8) && is-octal-digit c then
    digit-to-nat c
  else if (base == 10) && is-digit c then
    digit-to-nat c
  else if (base == 16) && is-hex-digit c then
    hex-to-nat c
  else
    None

