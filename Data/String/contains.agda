module Data.String.contains where

open import Data.Bool.Type
open import Data.Bool.if
open import Data.Bool.or
open import Data.String.Type
open import Data.String.to-list
open import Data.List.Type
open import Data.Char.Type
open import Data.Char.eq

-- Checks if the first string contains the second string.
-- Returns True if str contains substr, False otherwise.
contains : String → String → Bool
contains str substr = contains-list (to-list str) (to-list substr)
  where
  contains-list : List Char → List Char → Bool
  contains-list [] [] = True
  contains-list [] _  = False
  contains-list (x :: xs) ys =
    starts-with-list (x :: xs) ys || contains-list xs ys
    where
    starts-with-list : List Char → List Char → Bool
    starts-with-list _ [] = True
    starts-with-list [] (_ :: _) = False
    starts-with-list (x :: xs) (y :: ys) = 
      if x == y
      then starts-with-list xs ys
      else False
