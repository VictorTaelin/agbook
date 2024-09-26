module Base.AVLTree.invert where

open import Base.AVLTree.AVLTree
open import Base.AVLTree.fold
open import Base.AVLTree.insert
open import Base.AVLTree.empty
open import Base.Pair.Pair
open import Base.Trait.Ord

-- Inverts the key-value pairs in an AVL tree.
-- - tree: The input AVL tree.
-- = A new AVL tree with inverted key-value pairs.
invert : ∀ {K V : Set} {{_ : Ord V}} → AVLTree K V → AVLTree V K
invert = fold go empty where
  go : ∀ {K V : Set} {{_ : Ord V}} → Pair K V → AVLTree V K → AVLTree V K
  go (k , v) acc = (v , k) ::> acc
