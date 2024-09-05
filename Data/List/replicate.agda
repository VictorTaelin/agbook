module Data.List.replicate where

open import Data.List.Type
open import Data.Nat.Type

-- Replicates a value `n` times into a list.
replicate : ∀ {A : Set} → Nat → A → List A
replicate 0 x = []
replicate (Succ n) x = x :: replicate n x
