module Base.AVLTree.intersect where

open import Base.Bool.Type
open import Base.Maybe.Type
open import Base.Pair.get-fst
open import Base.Pair.get-snd
open import Base.Pair.Type
open import Base.Trait.Ord
open import Base.AVLTree.empty
open import Base.AVLTree.fold
open import Base.AVLTree.get
open import Base.AVLTree.has-key
open import Base.AVLTree.insert
open import Base.AVLTree.Type

-- Computes the intersection of two AVL trees.
-- - t₁: The first AVL tree.
-- - t₂: The second AVL tree.
-- = A new AVL tree containing only the key-value pairs present in both input trees.
intersect : ∀ {K V : Set} {{_ : Ord K}} -> AVL K V -> AVL K V -> AVL K V
intersect t1 t2 = fold (go t2) empty t1 where
  go : ∀ {K V : Set} {{_ : Ord K}} → AVL K V → Pair K V → AVL K V → AVL K V
  go include (k , v) acc with has-key k include
  ... | True  = (k , v) ::> acc
  ... | False = acc

-- Infix notation for intersecting two AVL trees.
-- - t₁: The first AVL tree.
-- - t₂: The second AVL tree.
-- = A new AVL tree containing only the key-value pairs present in both input trees.
_∩_ : ∀ {K V : Set} -> {{_ : Ord K}} -> AVL K V -> AVL K V -> AVL K V
_∩_ = intersect

infixr 6 _∩_
