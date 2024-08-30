module String.Main where

open import List.Main
open import Char.Main
open import Bool.Main

postulate String : Set
{-# BUILTIN STRING String #-}

-- Primitive functions for String.
primitive
  primStringAppend : String → String → String
  primStringToList : String → List Char
  primStringFromList : List Char → String
  primStringEquality : String → String → Bool
  primShowString     : String → String
