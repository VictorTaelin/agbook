module Data.List.replicate where

open import Data.List.Type
open import Data.Nat.Type

-- Replicates a value n times to create a list.
-- - n: The number of times to replicate the value.
-- - x: The value to replicate.
-- = A list consisting of n repetitions of x.
replicate : ∀ {A : Set} → Nat → A → List A
replicate Zero     x = []
replicate (Succ n) x = x :: replicate n x
