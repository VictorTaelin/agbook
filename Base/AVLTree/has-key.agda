module Base.AVLTree.has-key where

open import Base.Bool.Bool
open import Base.Ordering.Ordering
open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.AVLTree.AVLTree

-- Checks if a key exists in the AVL tree.
-- - key: The key to search for.
-- - tree: The AVL tree to search in.
-- = True if the key is found, False otherwise.
has-key : ∀ {K V : Set} -> {{_ : Ord K}} -> K -> AVLTree K V -> Bool
has-key _   Leaf = False
has-key key (Node (curr-key , _) _ left right) with compare key curr-key
... | LT = has-key key left
... | EQ = True
... | GT = has-key key right
