module Base.Map.count where

open import Base.Map.Type
open import Base.Nat.Type
open import Base.Nat.add
open import Base.Maybe.Type
open import Base.String.Type

-- Counts the number of elements in a Map.
-- - m: The Map to count elements from.
-- = The number of elements in the Map.
count : ∀ {A : Set} → Map A → Nat
count Leaf                       = Zero
count (Node None left right)     = count left + count right
count (Node (Some _) left right) = Succ (count left + count right)

