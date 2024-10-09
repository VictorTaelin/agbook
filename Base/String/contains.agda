module Base.String.contains where

open import Base.Bool.Bool
open import Base.String.String
open import Base.String.starts-with
open import Base.String.drop

-- Checks if one string contains another string.
-- - 1st: The string to search in.
-- - 2nd: The substring to search for.
-- = True if the first string contains the second string, False otherwise.
{-# TERMINATING #-} -- FIXME!
contains : String → String → Bool
contains str ""     = True
contains str substr = contains-go str where
  contains-go : String → Bool
  contains-go "" = False
  contains-go s with starts-with s substr
  ... | True  = True
  ... | False = contains-go (drop 1 s)

