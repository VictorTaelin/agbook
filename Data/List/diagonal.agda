module Data.List.diagonal where

open import Data.List.Type
open import Data.List.append
open import Data.List.foldr
open import Data.List.zip-cons

-- Extracts the diagonal elements from a list of lists.
-- - xss: The input list of lists.
-- = A new list containing the diagonal elements.
diagonal : ∀ {A : Set} → List (List A) → List A
diagonal = λ xss → foldr append [] (stripe xss)
  where
    -- Helper function to create a striped version of the input list of lists.
    -- - xss: The input list of lists.
    -- = A new list of lists where each sublist contains elements from the diagonal.
    stripe : ∀ {A : Set} → List (List A) → List (List A)
    stripe []                 = []
    stripe ([] :: xss)        = stripe xss
    stripe ((x :: xs) :: xss) = (x :: []) :: zip-cons xs (stripe xss)
