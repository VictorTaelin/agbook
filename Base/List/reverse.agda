module Base.List.reverse where

open import Base.List.Type
open import Base.List.foldl

-- Reverses a list.
-- - xs: The input list.
-- = A new list containing all elements from the input list in reverse order.
reverse : ∀ {a} {A : Set a} → List A → List A
reverse = foldl (λ xs x → x :: xs) []
