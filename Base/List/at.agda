module Base.List.at where

open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Nat.Nat

-- Get an element at a given index (if exists).
-- - xs: The input list.
-- - i : The index of the element to search.
-- = A Maybe element of type A.
at : ∀ {A : Set} → List A → Nat → Maybe A
at []        _        = None
at (x :: xs) Zero     = Some x
at (x :: xs) (Succ i) = at xs i

