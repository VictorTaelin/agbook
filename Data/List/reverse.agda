module Data.List.reverse where

open import Data.List.Type
open import Data.List.foldl

-- Reverses a list.
-- - xs: The input list.
-- = A new list containing all elements from the input list in reverse order.
reverse : ∀ {a} {A : Set a} → List A → List A
reverse = foldl (λ xs x → x :: xs) []
