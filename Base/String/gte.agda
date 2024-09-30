module Base.String.gte where

open import Base.String.String
open import Base.String.to-list
open import Base.Bool.Bool
open import Base.Char.Char
import Base.List.gte as List
import Base.Char.Trait.Ord as CharOrd

-- Checks if the first string is greater than or equal to the second string.
-- - 1st: The first string to compare.
-- - 2nd: The second string to compare.
-- = A boolean value: true if the first string is greater than or equal to the second, false otherwise.
gte : String → String → Bool
gte s1 s2 = List.gte {{CharOrd.OrdChar}} (to-list s1) (to-list s2)

-- Infix operator for gte.
_>=_ : String → String → Bool
_>=_ = gte

infix 4 _>=_

