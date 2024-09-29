module Base.AVLTree.difference where

open import Base.Bool.Bool
open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.AVLTree.AVLTree
open import Base.AVLTree.empty
open import Base.AVLTree.fold
open import Base.AVLTree.has-key
open import Base.AVLTree.insert

-- Computes the difference between two AVL trees.
-- - t1: The first AVL tree.
-- - t2: The second AVL tree.
-- = A new AVL tree containing elements from t1 that are not present in t2.
difference : ∀ {K V : Set} {{_ : Ord K}} → AVLTree K V → AVLTree K V → AVLTree K V
difference t1 t2 = fold (go t2) empty t1 where
  go : ∀ {K V : Set} {{_ : Ord K}} → AVLTree K V → Pair K V → AVLTree K V → AVLTree K V
  go exclude (k , v) acc with has-key k exclude
  ... | False = (k , v) ::> acc
  ... | True  = acc

-- Infix notation for the di§fference of two AVL trees.
-- - t₁: The first AVL tree.
-- - t₂: The second AVL tree.
-- = A new AVL tree containing elements from t₁ that are not present in t₂.
_∖_ : ∀ {K V : Set} → {{_ : Ord K}} → AVLTree K V → AVLTree K V → AVLTree K V
_∖_ = difference

infixr 6 _∖_