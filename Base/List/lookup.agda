module Base.List.lookup where

open import Base.List.List
open import Base.Nat.Nat
open import Base.Maybe.Maybe

-- Retrieves the element at the specified index in the list.
-- - xs: The input list.
-- - i: The index to retrieve.
-- = Just the element at index i if i < length xs, otherwise None.
lookup : ∀ {A : Set} -> List A -> Nat -> Maybe A
lookup []        _        = None
lookup (x :: _)  Zero     = Some x
lookup (_ :: xs) (Succ i) = lookup xs i
