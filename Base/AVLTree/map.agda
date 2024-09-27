module Base.AVLTree.map where

open import Base.AVLTree.AVLTree
open import Base.AVLTree.empty
open import Base.AVLTree.fold
open import Base.AVLTree.insert
open import Base.Pair.Pair
open import Base.Trait.Ord

-- Maps a function over all pairs in an AVL tree.
-- - f: The function to apply to each value.
-- - tree: The input AVL tree.
-- = A new AVL tree with the function applied to all values.
map : ∀ {K V A B : Set} → {{_ : Ord A}} → (Pair K V → Pair A B) → AVLTree K V → AVLTree A B
map f tree = fold (λ (k , v) acc → insert (f (k , v)) acc) empty tree
