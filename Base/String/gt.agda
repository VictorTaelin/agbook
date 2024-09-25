import Base.Char.Trait.Ord as CharOrd

import Base.List.gt as List
module Base.String.gt where
open import Base.Bool.Type
open import Base.Char.Type
open import Base.String.Type
open import Base.String.to-list

-- Compares two strings to check if the first is greater than the second.
-- - 1st: The first string to compare.
-- - 2nd: The second string to compare.
-- = A boolean value, true if the first string is greater than the second, false otherwise.
gt : String -> String -> Bool
gt s1 s2 = List.gt {{CharOrd.OrdChar}} (to-list s1) (to-list s2)

-- Infix operator for gt.
_>_ : String -> String -> Bool
_>_ = gt

infix 4 _>_

