module Base.String.append where

open import Base.String.Type

primitive primStringAppend : String -> String -> String

-- Concatenates two strings.
-- - s1: The 1st string.
-- - s2: The 2nd string.
-- = The concatenation of s1 and s2.
append : String -> String -> String
append = primStringAppend

_++_ : String -> String -> String
_++_ = append

infixr 5 _++_

{-# COMPILE JS primStringAppend = function(x) { return function(y) { return x+y; }; } #-}
