module Base.BitMap.del where

open import Base.BitMap.BitMap
open import Base.Bits.Bits
open import Base.Maybe.Maybe
open import Base.BinTree.BinTree

-- Removes a key-value pair from the BitMap.
-- - m: The BitMap to remove from.
-- - k: The Bits key to remove.
-- = A new BitMap with the key-value pair removed.
del : ∀ {A : Set} -> BitMap A -> Bits -> BitMap A
del (Node v l r) E     = Node None l r
del (Node v l r) (O k) = Node v (del l k) r
del (Node v l r) (I k) = Node v l (del r k)
del Leaf               _     = Leaf
