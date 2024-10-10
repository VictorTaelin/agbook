module Base.List.any-true where

open import Base.List.List
open import Base.List.foldr
open import Base.Bool.Bool
open import Base.Bool.or

-- Checks if any element of a list satisfies a given predicate.
-- - p: The predicate function to apply to each element.
-- - xs: The input list.
-- = True if any element satisfies the predicate, False otherwise.
any-true : ∀ {A : Set} → (A → Bool) → List A → Bool
any-true p = foldr (λ x acc → p x || acc) False

