module Base.Char.is-octal-digit where

open import Base.Char.Char
open import Base.Char.to-nat
open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.Nat.gte
open import Base.Nat.lte
open import Base.Bool.and

-- Checks if the character is a valid octal digit (0 to 7).
-- 1st: The character to check.
-- = True if the character is a octal digit, False otherwise.
is-octal-digit : Char → Bool
is-octal-digit c = (to-nat c >= 48) && (to-nat c <= 55)