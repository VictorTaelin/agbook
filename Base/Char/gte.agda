module Base.Char.gte where

open import Base.Char.Char
open import Base.Bool.Bool
open import Base.Char.to-nat
import Base.Nat.gte as Nat

-- Checks if the first character is greater than or equal to the second.
-- 1st: The character to compare.
-- 2nd: The character to compare.
-- = True if the 1st character is greater than or equal to the 2nd, False otherwise.
gte : Char → Char → Bool
gte x y = Nat.gte (to-nat x) (to-nat y)

-- Infix operator for greater than or equal comparison of characters.
_>=_ : Char → Char → Bool
_>=_ = gte

infix 4 _>=_

