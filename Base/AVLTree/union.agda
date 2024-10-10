module Base.AVLTree.union where

open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.AVLTree.fold
open import Base.AVLTree.insert
open import Base.AVLTree.AVLTree

-- Computes the union of two AVL trees.
-- - t1: The first AVL tree.
-- - t2: The second AVL tree.
-- = A new AVL tree containing all elements from both input trees,
--   with elements from t1 overwriting those from t2 in case of key conflicts.
union : ∀ {K V : Set} → {{_ : Ord K}} → AVLTree K V → AVLTree K V → AVLTree K V
union t1 t2 = fold insert t2 t1

-- Infix notation for the union of two AVL trees.
-- - t1: The first AVL tree.
-- - t2: The second AVL tree.
-- = A new AVL tree containing all elements from both input trees,
--   with elements from t2 overwriting those from t1 in case of key conflicts.
_∪_ : ∀ {K V : Set} → {{_ : Ord K}} → AVLTree K V → AVLTree K V → AVLTree K V
_∪_ = union

infixr 6 _∪_

