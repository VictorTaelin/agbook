module Base.List.unzip-with where

open import Base.List.Type
open import Base.Pair.Type

-- Unzips a list with a given function that generates a pair of lists.
-- - f: The function to apply to each element, generating a pair.
-- - xs: The input list to unzip.
-- = A pair of lists, where the first list contains all first elements of the pairs,
--   and the second list contains all second elements of the pairs.
unzip-with : ∀ {A B C : Set} -> (A -> Pair B C) -> List A -> Pair (List B) (List C)
unzip-with f [] = [] , []
unzip-with f (xy :: xys) with f xy , unzip-with f xys
... | (x , y) , (xs , ys) = (x :: xs) , (y :: ys)
