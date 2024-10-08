module Base.BinMap.count where

open import Base.BinMap.BinMap
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.add

-- Counts the number of elements in the BinMap.
-- - m: The BinMap to count elements in.
-- = The number of elements (non-None values) in the BinMap.
count : ∀ {A : Set} → BinMap A → Nat
count (Node None     l r) = add (count l) (count r)
count (Node (Some _) l r) = Succ (add (count l) (count r))
count Leaf                = Zero
