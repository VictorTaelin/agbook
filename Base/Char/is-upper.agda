module Base.Char.is-upper where

open import Base.Char.Char
open import Base.Char.to-nat
open import Base.Nat.lte
open import Base.Nat.gte
open import Base.Bool.Bool
open import Base.Bool.and

-- Checks if a character is uppercase based on Unicode ranges.
-- 1st: The character to check.
-- = True if the character is uppercase, False otherwise.
is-upper : Char → Bool
is-upper c = (to-nat c >= 65) && (to-nat c <= 90) 
