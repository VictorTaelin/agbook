module Data.String.lte where

open import Data.String.Type
open import Data.String.to-list
open import Data.Char.Type
open import Data.Char.lte using () renaming (_<=_ to _<='_)
open import Data.List.Type
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Bool.and

-- Compares two strings lexicographically (dictionary order).
-- - s1: The first string.
-- - s2: The second string.
-- = True if s1 is lexicographically less than or equal to s2, False otherwise.
lte : String → String → Bool
lte s1 s2 = lte-list (to-list s1) (to-list s2)
  where
  
  -- Compares two lists of characters lexicographically.
  -- - xs: The first list of characters.
  -- - ys: The second list of characters.
  -- = True if xs is lexicographically less than or equal to ys, False otherwise.
  lte-list : List Char → List Char → Bool
  lte-list [] [] = True
  lte-list [] (_ :: _) = True
  lte-list (_ :: _) [] = False
  lte-list (x :: xs) (y :: ys) with x <=' y
  ... | False = False
  ... | True = if ((x <=' y) && (y <=' x))
              then lte-list xs ys
              else True

-- Infix alias for lte
_<=_ : String → String → Bool
_<=_ = lte
