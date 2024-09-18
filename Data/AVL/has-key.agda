module Data.AVL.has-key where

open import Data.AVL.Type
open import Data.Bool.Type
open import Data.Trait.Ord
open import Data.Ordering.Type
open import Data.Pair.Type

-- Checks if a key exists in the AVL tree.
-- - key: The key to search for.
-- - tree: The AVL tree to search in.
-- = True if the key is found, False otherwise.
has-key : ∀ {K V : Set} → {{_ : Ord K}} → K → AVL K V → Bool
has-key _   Leaf = False
has-key key (Node curr _ left right) with compare key (Pair.fst curr)
... | LT = has-key key left
... | EQ = True
... | GT = has-key key right
