module Base.AVLTree.get-pair where

open import Base.Maybe.Maybe
open import Base.Ordering.Ordering
open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.AVLTree.AVLTree

-- Retrieves a key-value pair from the AVL tree based on the given key.
-- - key: The key to search for.
-- - tree: The AVL tree to search in.
-- = Some key-value pair if the key is found, None otherwise.
get-pair : ∀ {K V : Set} -> {{_ : Ord K}} -> K -> AVLTree K V -> Maybe (Pair K V)
get-pair _   Leaf = None
get-pair key (Node (curr-key , curr-val) _ left right) with compare key curr-key
... | LT = get-pair key left
... | EQ = Some (curr-key , curr-val)
... | GT = get-pair key right
