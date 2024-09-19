module Base.String.starts-with where

open import Base.Bool.Type
open import Base.Bool.if
open import Base.Char.Type
open import Base.Char.eq
open import Base.List.Type
open import Base.String.Type
open import Base.String.to-list

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
