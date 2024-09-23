module Base.BitMap.count where

open import Base.BitMap.Type
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Nat.add
open import Base.String.Type

-- Counts the number of elements in a BitMap.
-- - m: The BitMap to count elements from.
-- = The number of elements in the BitMap.
count : ∀ {A : Set} ->BitMap A -> Nat
count Leaf                = Zero
count (Node None     l r) = count l + count r
count (Node (Some _) l r) = Succ (count l + count r)

