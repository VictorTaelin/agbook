module Data.AVL.get where

open import Data.AVL.Type
open import Data.Maybe.Type
open import Data.Trait.Ord
open import Data.Ordering.Type
open import Data.Pair.Type

-- Retrieves a value associated with a key from the AVL tree.
-- - key: The key to search for.
-- - tree: The AVL tree to search in.
-- = Some value if the key is found, None otherwise.
get : ∀ {K V : Set} → {{_ : Ord K}} → K → AVL K V → Maybe V
get _   Leaf = None
get key (Node curr _ left right) with compare key (Pair.fst curr)
... | LT = get key left
... | EQ = Some (Pair.snd curr)
... | GT = get key right
