module Base.Map.take where

open import Base.Map.Type
open import Base.Bits.Type
open import Base.Maybe.Type
open import Base.TreeBin.Type
open import Base.Pair.Type

-- Retrieves and removes a value from the Map given a key.
-- - m: The Map to search in and remove from.
-- - k: The Bits key to look up and remove.
-- = A pair containing the new Map and the value associated with the key (wrapped in Maybe).
take : ∀ {A : Set} → Map A → Bits → Pair (Map A) (Maybe A)
take (Node val lft rgt) E     = (Node None lft rgt) , val
take (Node val lft rgt) (O k) = do
  let (new-lft , v) = take lft k
  (Node val new-lft rgt) , v
take (Node val lft rgt) (I k) = do
  let (new-rgt , v) = take rgt k
  (Node val lft new-rgt) , v
take Leaf               _     = Leaf , None
