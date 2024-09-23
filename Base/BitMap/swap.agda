module Base.BitMap.swap where

open import Base.BitMap.Type
open import Base.Bits.Type
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.TreeBin.Type

-- Swaps a value in the BitMap for a new value, returning the old value if it existed.
-- - m: The BitMap to swap in.
-- - k: The Bits key to swap.
-- - v: The new value to insert.
-- = A pair containing the new BitMap and the old value associated with the key (wrapped in Maybe).
swap : ∀ {A : Set} -> BitMap A -> Bits -> A -> Pair (BitMap A) (Maybe A)
swap (Node val l r) E v = (Node (Some v) l r) , val

swap (Node val l r) (O k) v = do 
  let (new-l , old-v) = swap l k v 
  (Node val new-l r) , old-v

swap (Node val l r) (I k) v = do 
  let (new-r , old-v) = swap r k v 
  (Node val l new-r) , old-v

swap Leaf E v = (Node (Some v) Leaf Leaf) , None

swap Leaf (O k) v = do 
  let (new-l , old-v) = swap Leaf k v
  (Node None new-l Leaf) , old-v

swap Leaf (I k) v = do 
  let (new-r , old-v) = swap Leaf k v 
  (Node None Leaf new-r) , old-v
