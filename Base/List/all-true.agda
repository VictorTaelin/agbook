module Base.List.all-true where

open import Base.List.List
open import Base.List.foldr
open import Base.Bool.Bool
open import Base.Bool.and

-- Checks if all elements of a list satisfy a given predicate.
-- - p: The predicate function to apply to each element.
-- - xs: The input list.
-- = True if all elements satisfy the predicate, False otherwise.
all-true : ∀ {A : Set} → (A → Bool) → List A → Bool
all-true p = foldr (λ x acc → p x && acc) True

