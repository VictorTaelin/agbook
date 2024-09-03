module Data.Map.count where

open import Data.Map.Type
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Nat.add
open import Data.Maybe.Type
open import Data.String.Type

-- Counts the number of elements in a Map.
-- - m: The Map to count elements from.
-- = The number of elements in the Map.
count : ∀ {A : Set} → Map A → Nat
count Leaf = Zero
count (Node None left right) = count left + count right
count (Node (Some _) left right) = Succ (count left + count right)

