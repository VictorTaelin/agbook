module Data.List.unzip-with where

open import Data.List.Type
open import Data.Pair.Type

-- Unzips a list with a given function that generates a pair of lists.
unzip-with : ∀ {A B C : Set} → (A → Pair B C) → List A → Pair (List B) (List C)
unzip-with f [] = [] , []
unzip-with f (xy :: xys) with f xy , unzip-with f xys
... | (x , y) , (xs , ys) = (x :: xs) , (y :: ys)
