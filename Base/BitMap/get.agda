module Base.BitMap.get where

open import Base.BitMap.BitMap
open import Base.Bits.Bits
open import Base.Maybe.Maybe
open import Base.BinTree.BinTree

-- Retrieves a value from the BitMap given a key.
-- - m: The BitMap to search in.
-- - k: The Bits key to look up.
-- = The value associated with the key, wrapped in Maybe.
get : ∀ {A : Set} → BitMap A → Bits → Maybe A
get (Node val _ _) E     = val
get (Node _   l _) (O k) = get l k
get (Node _   _ r) (I k) = get r k
get Leaf           _     = None
