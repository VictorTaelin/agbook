module Base.List.diagonal where

open import Base.List.List
open import Base.List.append
open import Base.List.foldr
open import Base.List.zip-cons

-- Extracts the diagonal elements from a list of lists.
-- - xss: The input list of lists.
-- = A new list containing the diagonal elements.
diagonal : ∀ {A : Set} -> List (List A) -> List A
diagonal = λ xss -> foldr append [] (stripe xss)
  where
    -- Helper function to create a striped version of the input list of lists.
    -- - xss: The input list of lists.
    -- = A new list of lists where each sublist contains elements from the diagonal.
    stripe : ∀ {A : Set} -> List (List A) -> List (List A)
    stripe []                 = []
    stripe ([] :: xss)        = stripe xss
    stripe ((x :: xs) :: xss) = (x :: []) :: zip-cons xs (stripe xss)
