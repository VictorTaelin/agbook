module Base.BinMap.del where

open import Base.BinMap.BinMap
open import Base.Bits.Bits
open import Base.Maybe.Maybe
open import Base.BinTree.BinTree

-- Removes a key-value pair from the BinMap.
-- - m: The BinMap to remove from.
-- - k: The Bits key to remove.
-- = A new BinMap with the key-value pair removed.
del : ∀ {A : Set} → BinMap A → Bits → BinMap A
del (Node v l r) E     = Node None l r
del (Node v l r) (O k) = Node v (del l k) r
del (Node v l r) (I k) = Node v l (del r k)
del Leaf               _     = Leaf
