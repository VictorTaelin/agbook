module Base.List.drop where

open import Base.List.List
open import Base.Nat.Nat

-- Drops the first n elements from a list.
-- Returns the list without its first n elements.
drop : ∀ {A : Set} → Nat → List A → List A
drop Zero     xs        = xs
drop (Succ n) []        = []
drop (Succ n) (x :: xs) = drop n xs
