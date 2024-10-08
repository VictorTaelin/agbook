module Base.BinMap.get where

open import Base.BinMap.BinMap
open import Base.Bits.Bits
open import Base.Maybe.Maybe
open import Base.BinTree.BinTree

-- Retrieves a value from the BinMap given a key.
-- - m: The BinMap to search in.
-- - k: The Bits key to look up.
-- = The value associated with the key, wrapped in Maybe.
get : ∀ {A : Set} → BinMap A → Bits → Maybe A
get (Node val _ _) E     = val
get (Node _   l _) (O k) = get l k
get (Node _   _ r) (I k) = get r k
get Leaf           _     = None
