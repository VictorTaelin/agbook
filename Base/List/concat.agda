module Base.List.concat where

open import Base.List.List
open import Base.List.foldr
open import Base.List.append

-- Concatenates a list of lists into a single list.
-- - xss: The input list of lists.
-- = A new list containing all elements from all inner lists.
concat : ∀ {A : Set} → List (List A) → List A
concat = foldr _++_ []
