module Data.String.Type where

postulate String : Set
{-# BUILTIN STRING String #-}

-- -- Primitive functions for String.
-- primitive
  -- primStringToList   : String → List Char
  -- primStringFromList : List Char → String
  -- primStringEquality : String → String → Bool
  -- primShowString     : String → String
