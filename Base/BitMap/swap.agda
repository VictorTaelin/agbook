module Base.BitMap.swap where

open import Base.BitMap.BitMap
open import Base.Bits.Bits
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.BinTree.BinTree

-- Swaps a value in the BitMap for a new value, returning the old value if it existed.
-- - m: The BitMap to swap in.
-- - k: The Bits key to swap.
-- - v: The new value to insert.
-- = A pair containing the new BitMap and the old value associated with the key (wrapped in Maybe).
swap : ∀ {A : Set} -> BitMap A -> Bits -> A -> Pair (BitMap A) (Maybe A)
swap (Node val l r) E v = do 
  let n = (Node (Some v) l r) 
  n , val

swap (Node val l r) (O k) v = do 
  let (new-l , old-v) = swap l k v 
  (Node val new-l r) , old-v

swap (Node val l r) (I k) v = do 
  let (new-r , old-v) = swap r k v 
  (Node val l new-r) , old-v

swap Leaf E v = do
  let n = (Node (Some v) Leaf Leaf)
  n , None

swap Leaf (O k) v = do 
  let (new-l , old-v) = swap Leaf k v
  (Node None new-l Leaf) , old-v

swap Leaf (I k) v = do 
  let (new-r , old-v) = swap Leaf k v 
  (Node None Leaf new-r) , old-v
