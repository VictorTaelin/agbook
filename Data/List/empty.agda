module Data.List.empty where

open import Data.List.Type
open import Data.Bool.Type

-- Checks if a list is empty.
empty : ∀ {A : Set} → List A → Bool
empty [] = True
empty _ = False
