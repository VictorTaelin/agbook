module Base.AVLTree.filter where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Pair.Pair
open import Base.Pair.get-fst
open import Base.Trait.Ord
open import Base.AVLTree.AVLTree
open import Base.AVLTree.fold
open import Base.AVLTree.empty
open import Base.AVLTree.insert

-- Filters an AVL tree based on a predicate function.
-- - pred: The predicate function to test each key-value pair.
-- - tree: The input AVL tree.
-- = A new AVL tree containing only elements that satisfy the predicate.
filter : ∀ {K V : Set} → {{_ : Ord K}} → (K → Bool) → AVLTree K V → AVLTree K V
filter pred = fold (λ (k , v) acc → if pred k then (k , v) ::> acc else acc) empty
