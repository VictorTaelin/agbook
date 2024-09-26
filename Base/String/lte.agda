module Base.String.lte where

import Base.Char.Trait.Ord as CharOrd
import Base.List.lte as List
open import Base.Bool.Bool
open import Base.Char.Char
open import Base.String.String
open import Base.String.to-list

-- Compares two strings lexicographically for less than or equal to.
-- - 1st: The first string to compare.
-- - 2nd: The second string to compare.
-- = A boolean value: true if the first string is lexicographically less than or equal to the second, false otherwise.
lte : String -> String -> Bool
lte s1 s2 = List.lte {{CharOrd.OrdChar}} (to-list s1) (to-list s2)

-- Infix operator for lte.
_<=_ : String -> String -> Bool
_<=_ = lte

infix 4 _<=_

