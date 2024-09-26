module Base.AVLTree.get where

open import Base.Maybe.Maybe
open import Base.Ordering.Ordering
open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.AVLTree.AVLTree

-- Retrieves a value associated with a key from the AVL tree.
-- - key: The key to search for.
-- - tree: The AVL tree to search in.
-- = Some value if the key is found, None otherwise.
get : ∀ {K V : Set} -> {{_ : Ord K}} -> K -> AVLTree K V -> Maybe V
get _   Leaf = None
get key (Node (curr-key , curr-val) _ left right) with compare key curr-key
... | LT = get key left
... | EQ = Some curr-val
... | GT = get key right
