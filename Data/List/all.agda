module Data.List.all where

open import Data.List.Type
open import Data.List.map
open import Data.List.and
open import Data.Bool.Type

-- Checks if all the elements in a list return true for a predicate.
all : ∀ {A : Set} → (A → Bool) → List A → Bool
all p xs = and (map p xs)
