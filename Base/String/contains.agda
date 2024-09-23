module Base.String.contains where

open import Base.Bool.Type
open import Base.Bool.if
open import Base.Bool.or
open import Base.String.Type
open import Base.String.to-list
open import Base.List.Type
open import Base.Char.Type
open import Base.Char.eq

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
