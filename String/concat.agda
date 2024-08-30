module String.concat where

open import String.Main

-- Concatenates two strings
-- s1: the first string
-- s2: the second string
-- = a new string containing all characters from s1 followed by all characters from s2
_++_ : String → String → String
s1 ++ s2 = primStringAppend s1 s2

{-# COMPILE JS _++_ = function(s1) { return function(s2) { return s1 + s2; }; } #-}

infixr 5 _++_
