module Data.List.remove-at where

open import Data.List.Type
open import Data.Nat.Type
open import Data.Nat.lt
open import Data.Maybe.Type
open import Data.Bool.if

-- Removes the element at the specified index from the list.
-- If the index is out of bounds, returns the original list.
-- - n: The index of the element to remove.
-- - xs: The input list.
-- = A new list with the element at index n removed, or the original list if n is out of bounds.
remove-at : ∀ {A : Set} → List A → Nat → List A
remove-at []        _        = []
remove-at (_ :: xs) Zero     = xs
remove-at (x :: xs) (Succ n) = x :: remove-at xs n
