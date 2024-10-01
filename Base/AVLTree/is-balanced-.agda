module Base.AVLTree.is-balanced- where

open import Base.AVLTree.Balance.Balance
open import Base.AVLTree.AVLTree
open import Base.AVLTree.height
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Nat.sub

-- Checks if an AVL tree is balanced.
-- - tree: The AVL tree to check.
-- = Some height if the tree is balanced, None otherwise.
is-balanced-go : ∀ {K V : Set} → AVLTree K V → Maybe Nat
is-balanced-go Leaf = Some Zero
is-balanced-go (Node _ balance left right) with is-balanced-go left | is-balanced-go right
... | None | _    = None
... | _    | None = None
... | Some h-left | Some h-right with balance
...   | -one = if h-left  == Succ h-right then Some (Succ h-left)  else None
...   | zero = if h-left  == h-right      then Some (Succ h-left)  else None
...   | +one = if h-right == Succ h-left  then Some (Succ h-right) else None

-- Boolean return for the `is-balanced'` function
-- - tree: The AVL tree to check.
-- = True if the tree is balanced, False otherwise.
is-balanced : ∀ {K V : Set} → AVLTree K V → Bool
is-balanced tree with is-balanced-go tree
... | Some _ = True
... | None   = False
