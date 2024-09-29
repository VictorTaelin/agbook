module Base.BitMap.count where

open import Base.BitMap.BitMap
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.add

-- Counts the number of elements in the BitMap.
-- - m: The BitMap to count elements in.
-- = The number of elements (non-None values) in the BitMap.
count : ∀ {A : Set} → BitMap A → Nat
count (Node None     l r) = add (count l) (count r)
count (Node (Some _) l r) = Succ (add (count l) (count r))
count Leaf                = Zero
