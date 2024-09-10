module Data.String.starts-with where

open import Data.Bool.Type
open import Data.Bool.if
open import Data.Char.Type
open import Data.Char.eq
open import Data.Trait.Eq
open import Data.List.Type
open import Data.String.Type
open import Data.String.to-list

-- Checks if the first string starts with the second string.
-- Returns True if str starts with prefix, False otherwise.
starts-with : String → String → Bool
starts-with str prefix = starts-with-list (to-list str) (to-list prefix)
  where
  starts-with-list : List Char → List Char → Bool
  starts-with-list []        []        = True
  starts-with-list (_ :: _)  []        = True
  starts-with-list []        (_ :: _)  = False
  starts-with-list (x :: xs) (y :: ys) = 
    if x == y
    then starts-with-list xs ys
    else False
