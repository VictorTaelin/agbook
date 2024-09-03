module Data.Map.swap where

open import Data.Map.Type
open import Data.Bits.Type
open import Data.Maybe.Type
open import Data.Tree.Type
open import Data.Pair.Type

-- Swaps a value in the Map for a new value, returning the old value if it existed.
-- - m: The Map to swap in.
-- - k: The Bits key to swap.
-- - v: The new value to insert.
-- = A pair containing the new Map and the old value associated with the key (wrapped in Maybe).
swap : ∀ {A : Set} → Map A → Bits → A → Pair (Map A) (Maybe A)
swap (Node val lft rgt) E     v = (Node (Some v) lft rgt) , val
swap (Node val lft rgt) (O k) v = 
  let (new-lft , old-val) = swap lft k v
  in (Node val new-lft rgt) , old-val
swap (Node val lft rgt) (I k) v = 
  let (new-rgt , old-val) = swap rgt k v
  in (Node val lft new-rgt) , old-val
swap Leaf               k     v = (Node (Some v) Leaf Leaf) , None
