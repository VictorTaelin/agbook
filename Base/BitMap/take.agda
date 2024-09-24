module Base.BitMap.take where

open import Base.BitMap.Type
open import Base.Bits.Type
open import Base.Maybe.Type
open import Base.BinTree.Type
open import Base.Pair.Type

-- Retrieves and removes a value from the BitMap given a key.
-- - m: The BitMap to search in and remove from.
-- - k: The Bits key to look up and remove.
-- = A pair containing the new BitMap and the value associated with the key (wrapped in Maybe).
take : ∀ {A : Set} -> BitMap A -> Bits -> Pair (BitMap A) (Maybe A)
take (Node val lft rgt) E     = (Node None lft rgt) , val
take (Node val lft rgt) (O k) = do
  let (new-lft , v) = take lft k
  (Node val new-lft rgt) , v
take (Node val lft rgt) (I k) = do
  let (new-rgt , v) = take rgt k
  (Node val lft new-rgt) , v
take Leaf               _     = Leaf , None
