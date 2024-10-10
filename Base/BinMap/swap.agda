module Base.BinMap.swap where

open import Base.BinMap.BinMap
open import Base.Bits.Bits
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.BinTree.BinTree
open import Base.Maybe.map

-- Swaps a value in the BinMap for a new value, returning the old value if it existed.
-- - m: The BinMap to swap in.
-- - k: The Bits key to swap.
-- - v: The new value to insert.
-- = Maybe containing a pair of the new BinMap and the old value if the key existed, None otherwise.
swap : ∀ {A : Set} → BinMap A → Bits → A → Maybe (Pair (BinMap A) A)
swap (Node (Some x) l r) E     v = Some ((Node (Some v) l r) , x)
swap (Node None     l r) E     v = None
swap (Node val      l r) (O k) v = map (λ { (new-l , old-v) → (Node val new-l r) , old-v }) (swap l k v)
swap (Node val      l r) (I k) v = map (λ { (new-r , old-v) → (Node val l new-r) , old-v }) (swap r k v)
swap Leaf                E     v = None
swap Leaf                (O k) v = map (λ { (new-l , old-v) → (Node None new-l Leaf) , old-v }) (swap Leaf k v)
swap Leaf                (I k) v = map (λ { (new-r , old-v) → (Node None Leaf new-r) , old-v }) (swap Leaf k v)

