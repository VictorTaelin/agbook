module Base.String.neq where

import Base.String.eq as String
open import Base.Bool.Bool
open import Base.Bool.not
open import Base.String.String

-- Checks if two strings are not equal.
-- - 1st: The first string to compare.
-- - 2nd: The second string to compare.
-- = A boolean value: true if the strings are not equal, false otherwise.
neq : String -> String -> Bool
neq x y = not (String.eq x y)

-- Infix operator for string inequality.
_!=_ : String -> String -> Bool
_!=_ = neq

infix 4 _!=_

