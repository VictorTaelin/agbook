module Base.BitMap.del where

open import Base.BitMap.Type
open import Base.Bits.Type
open import Base.Maybe.Type
open import Base.TreeBin.Type

-- Removes a key-value pair from the BitMap.
-- - m: The BitMap to remove from.
-- - k: The Bits key to remove.
-- = A new BitMap with the key-value pair removed.
del : ∀ {A : Set} → BitMap A → Bits → BitMap A
del (Node val lft rgt) E     = Node None lft rgt
del (Node val lft rgt) (O k) = Node val (del lft k) rgt
del (Node val lft rgt) (I k) = Node val lft (del rgt k)
del Leaf               _     = Leaf
