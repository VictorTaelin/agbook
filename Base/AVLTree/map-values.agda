module Base.AVLTree.map-values where

open import Base.AVLTree.AVLTree
open import Base.AVLTree.empty
open import Base.AVLTree.fold
open import Base.AVLTree.insert
open import Base.Pair.Pair
open import Base.Trait.Ord

-- Maps a function over all values in an AVL tree.
-- - f: The function to apply to each value.
-- - tree: The input AVL tree.
-- = A new AVL tree with the function applied to all values.
map-values : ∀ {K V B : Set} → {{_ : Ord K}} → (V → B) → AVLTree K V → AVLTree K B
map-values f tree = fold (λ (k , v) acc → insert (k , f v) acc) empty tree

