module Data.String.Main where

open import Data.List.Main
open import Data.Char.Main
open import Data.Bool.Main

postulate String : Set
{-# BUILTIN STRING String #-}

-- Primitive functions for String.
primitive
  primStringAppend   : String → String → String
  primStringToList   : String → List Char
  primStringFromList : List Char → String
  primStringEquality : String → String → Bool
  primShowString     : String → String
