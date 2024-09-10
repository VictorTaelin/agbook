module Data.List.reverse where

open import Data.List.Type
open import Data.List.foldl

-- Reverses a list.
-- - xs: The input list.
-- = A new list containing all elements from the input list in reverse order.
reverse : ∀ {A : Set} → List A → List A
reverse = foldl (λ xs x → x :: xs) []
