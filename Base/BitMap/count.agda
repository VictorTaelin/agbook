module Base.BitMap.count where

open import Base.BitMap.Type
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Nat.add

-- Counts the number of elements in the BitMap.
-- - m: The BitMap to count elements in.
-- = The number of elements (non-None values) in the BitMap.
count : ∀ {A : Set} → BitMap A → Nat
count (Node None     lft rgt) = add (count lft) (count rgt)
count (Node (Some _) lft rgt) = Succ (add (count lft) (count rgt))
count Leaf                    = Zero
