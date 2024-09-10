module Data.List.iterate where

open import Data.List.Type
open import Data.Nat.Type

-- Generates a list by iterating a function over an initial value.
-- - f: The function to be applied repeatedly.
-- - x: The initial value.
-- - n: The number of iterations.
-- = A list containing the results of applying f repeatedly, n times.
iterate : ∀ {A : Set} → (A → A) → A → Nat → List A
iterate f x Zero     = []
iterate f x (Succ n) = x :: iterate f (f x) n
