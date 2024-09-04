module Data.Map.remove where

open import Data.Map.Type
open import Data.Bits.Type
open import Data.Maybe.Type
open import Data.Tree.Type

-- Removes a key-value pair from the Map.
-- - m: The Map to remove from.
-- - k: The Bits key to remove.
-- = A new Map with the key-value pair removed.
remove : ∀ {A : Set} → Map A → Bits → Map A
remove (Node val lft rgt) E     = Node None lft rgt
remove (Node val lft rgt) (O k) = Node val (remove lft k) rgt
remove (Node val lft rgt) (I k) = Node val lft (remove rgt k)
remove Leaf               _     = Leaf
