module Data.Char.lte where

open import Data.Char.Type
open import Data.Char.to-nat
open import Data.Nat.Type
open import Data.Nat.lte using () renaming (_<=_ to _<='_)
open import Data.Bool.Type

-- Less-than-or-equal-to comparison for characters.
-- Implemented by converting to Nat and using Nat.lte.
-- - x: The 1st character.
-- - y: The 2nd character.
-- = True if x is less than or equal to y.
lte : Char → Char → Bool
lte x y = to-nat x <=' to-nat y

_<=_ : Char → Char → Bool
_<=_ = lte
