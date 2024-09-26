module Base.BitMap.contains where

open import Base.BitMap.BitMap
open import Base.Bits.Bits
open import Base.Bool.Bool
open import Base.Maybe.Maybe
open import Base.BinTree.BinTree

-- Checks if a key exists in the BitMap.
-- - m: The BitMap to search in.
-- - k: The Bits key to look for.
-- = True if the key exists in the BitMap, False otherwise.
contains : ∀ {A : Set} -> BitMap A -> Bits -> Bool
contains (Node (Some _) _ _) E     = True
contains (Node None     _ _) E     = False
contains (Node _        l _) (O k) = contains l k
contains (Node _        _ r) (I k) = contains r k
contains Leaf                   _      = False
