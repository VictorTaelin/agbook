module Base.BitMap.get where

open import Base.BitMap.Type
open import Base.Maybe.Type
open import Base.TreeBin.Type
open import Base.Bits.Type

-- Retrieves a value from the BitMap given a key.
-- - m: The BitMap to search in.
-- - k: The Bits key to look up.
-- = The value associated with the key, wrapped in Maybe.
get : ∀ {A : Set} → BitMap A → Bits → Maybe A
get (Node val _   _  ) E     = val
get (Node _   lft _  ) (O k) = get lft k
get (Node _   _   rgt) (I k) = get rgt k
get Leaf               _     = None
