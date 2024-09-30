module Base.String.lt where

import Base.Char.Trait.Ord as CharOrd
import Base.List.lt as List
open import Base.Bool.Bool
open import Base.Char.Char
open import Base.String.String
open import Base.String.to-list

-- Compares two strings lexicographically.
-- - 1st: The first string to compare.
-- - 2nd: The second string to compare.
-- = True if the first string is lexicographically less than the second, False otherwise.
lt : String → String → Bool
lt s1 s2 = List.lt {{CharOrd.OrdChar}} (to-list s1) (to-list s2)

-- Infix operator for lt.
_<_ : String → String → Bool
_<_ = lt

infix 4 _<_

