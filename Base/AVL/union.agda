module Base.AVL.union where

open import Base.AVL.Type
open import Base.AVL.insert
open import Base.AVL.fold
open import Base.Pair.Type
open import Base.Trait.Ord

-- Computes the union of two AVL trees.
-- - t1: The first AVL tree.
-- - t2: The second AVL tree.
-- = A new AVL tree containing all elements from both input trees,
--   with elements from t2 overwriting those from t1 in case of key conflicts.
union : ∀ {K V : Set} → {{_ : Ord K}} → AVL K V → AVL K V → AVL K V
union t1 t2 = fold insert t1 t2

-- Infix notation for the union of two AVL trees.
-- - t1: The first AVL tree.
-- - t2: The second AVL tree.
-- = A new AVL tree containing all elements from both input trees,
--   with elements from t2 overwriting those from t1 in case of key conflicts.
_∪_ : ∀ {K V : Set} → {{_ : Ord K}} → AVL K V → AVL K V → AVL K V
_∪_ = union

infixr 6 _∪_
