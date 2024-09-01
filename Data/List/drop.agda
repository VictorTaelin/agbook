module Data.List.drop where

open import Data.List.Type
open import Data.Nat.Type

-- Drops the first n elements from a list.
-- Returns the list without its first n elements.
drop : ∀ {A : Set} → Nat → List A → List A
drop Zero     xs        = xs
drop (Succ n) []        = []
drop (Succ n) (x :: xs) = drop n xs
