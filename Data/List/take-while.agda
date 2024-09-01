module Data.List.take-while where

open import Data.Bool.Type
open import Data.List.Type

-- Takes elements from the front of the list as long as they satisfy the predicate.
-- - fn: The predicate function.
-- - xs: The input list.
-- = A list containing the longest prefix of xs of elements that satisfy p.
take-while : ∀ {A : Set} → (A → Bool) → List A → List A
take-while fn [] = []
take-while fn (x :: xs) with fn x
... | True  = x :: take-while fn xs
... | False = []
