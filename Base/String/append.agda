module Base.String.append where

open import Base.String.String

primitive primStringAppend : String -> String -> String

-- Concatenates two strings.
-- - 1st: The first string.
-- - 2nd: The second string.
-- = A new string that is the concatenation of the two input strings.
append : String -> String -> String
append = primStringAppend

-- Infix operator for append.
_++_ : String -> String -> String
_++_ = append

infixr 5 _++_

{-# COMPILE JS primStringAppend = function(x) { return function(y) { return x+y; }; } #-}
