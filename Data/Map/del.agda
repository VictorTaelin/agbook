module Data.Map.del where

open import Data.Map.Type
open import Data.Bits.Type
open import Data.Maybe.Type
open import Data.Tree.Type

-- Removes a key-value pair from the Map.
-- - m: The Map to remove from.
-- - k: The Bits key to remove.
-- = A new Map with the key-value pair removed.
del : ∀ {A : Set} → Map A → Bits → Map A
del (Node val lft rgt) E     = Node None lft rgt
del (Node val lft rgt) (O k) = Node val (del lft k) rgt
del (Node val lft rgt) (I k) = Node val lft (del rgt k)
del Leaf               _     = Leaf
