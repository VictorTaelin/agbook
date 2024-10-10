module Base.AVLTree.map-keys where

open import Base.AVLTree.AVLTree
open import Base.AVLTree.empty
open import Base.AVLTree.fold
open import Base.AVLTree.insert
open import Base.Pair.Pair
open import Base.Trait.Ord

-- Maps a function over all keys in an AVL tree.
-- - f: The function to apply to each value.
-- - tree: The input AVL tree.
-- = A new AVL tree with the function applied to all values.
map-keys : ∀ {K V A : Set} → {{_ : Ord A}} → (K → A) → AVLTree K V → AVLTree A V
map-keys f tree = fold (λ (k , v) acc → insert (f k , v) acc) empty tree

