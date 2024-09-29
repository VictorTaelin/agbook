module Base.AVLTree.delete where

open import Base.AVLTree.AVLTree
open import Base.AVLTree.AVLTree
open import Base.AVLTree.Delete.delete-go
open import Base.Pair.get-fst
open import Base.Trait.Ord

-- Deletes a key-value pair from an AVL tree, maintaining balance.
-- - k: The key to delete.
-- - t: The AVL tree to delete from.
-- = A new AVL tree with the value deleted and balance maintained.
delete : ∀ {K V : Set} → {{_ : Ord K}} → K → AVLTree K V → AVLTree K V
delete k t = get-fst (delete-go k t)