module Base.String.contains where

open import Base.Bool.Type
open import Base.String.Type
open import Base.String.starts-with
open import Base.String.drop

-- Checks if the first string contains the second string.
-- Returns True if str contains substr, False otherwise.
contains : String -> String -> Bool
contains str substr = go str where
  go : String -> Bool
  go "" = False
  go s with starts-with s substr
  ... | True  = True
  ... | False = go (drop 1 s)
