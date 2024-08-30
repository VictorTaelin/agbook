module Data.String.append where

open import Data.String.Main

-- Concatenates two strings.
-- - s1: The 1st string.
-- - s2: The 2nd string.
-- = A new string containing all characters from s1 followed by all characters from s2.
_++_ : String → String → String
s1 ++ s2 = primStringAppend s1 s2

{-# COMPILE JS _++_ = function(s1) { return function(s2) { return s1 + s2; }; } #-}

infixr 5 _++_
