module Base.BitMap.del where

open import Base.BitMap.Type
open import Base.Bits.Type
open import Base.Maybe.Type
open import Base.TreeBin.Type

-- Removes a key-value pair from the BitMap.
-- - m: The BitMap to remove from.
-- - k: The Bits key to remove.
-- = A new BitMap with the key-value pair removed.
del : ∀ {A : Set} -> BitMap A -> Bits -> BitMap A
del (Node v l r) E     = Node None l r
del (Node v l r) (O k) = Node v (del l k) r
del (Node v l r) (I k) = Node v l (del r k)
del Leaf               _     = Leaf
