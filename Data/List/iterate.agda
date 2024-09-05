module Data.List.iterate where

open import Data.List.Type
open import Data.Nat.Type

-- Iterates a function over and over again, generating a list.
iterate : ∀ {A : Set} → (A → A) → A → Nat → List A
iterate f e 0 = []
iterate f e (Succ n) = iterate f (f e) n
