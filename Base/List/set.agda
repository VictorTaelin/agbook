module Base.List.set where

open import Base.List.List
open import Base.Nat.Nat
open import Base.Nat.sub
open import Base.Function.id

-- Applies a function to a specific element in a list.
-- - n: The index of the element to modify (0-based).
-- - fn: The function to apply to the element.
-- - xs: The input list.
-- = A new list with the function applied to the nth element.
set : ∀ {A : Set} → Nat → (A → A) → List A → List A
set Zero     fn (x :: xs) = fn x :: xs
set (Succ n) fn (x :: xs) = x :: set n fn xs
set _        _  []        = []
