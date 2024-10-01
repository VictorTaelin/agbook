module Base.List.split-chunks where

open import Base.Bool.Bool
open import Base.List.List
open import Base.Function.case

-- Splits a list into chunks, separated by elements that satisfy a predicate function.
-- Each chunk starts with an element that satisfies the predicate, except for the first chunk.
-- - pred: A predicate function that determines where to split the list.
-- - xs: The input list.
-- = A list of lists, where each list has one of the list chunks.
split-chunks : ∀ {A : Set} → (A → Bool) → List A → List (List A)
split-chunks pred [] = []
split-chunks pred (x :: xs) with (split-chunks pred xs) | (pred x)
... | []                | False = (x :: []) :: []
... | []                | True  = [] :: (x :: []) :: []
... | (chunk :: chunks) | False = (x :: chunk) :: chunks
... | (chunk :: chunks) | True  = [] :: (x :: chunk) :: chunks
