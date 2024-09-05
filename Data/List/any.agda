module Data.List.any where

open import Data.List.Type
open import Data.List.map
open import Data.List.or
open import Data.Bool.Type

-- Checks if any element of a list return true for a predicate.
any : ∀ {A : Set} → (A → Bool) → List A → Bool
any p xs = or (map p xs)
