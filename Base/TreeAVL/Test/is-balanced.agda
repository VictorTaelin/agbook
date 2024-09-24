module Base.TreeAVL.Test.is-balanced where

open import Base.TreeAVL.Type
open import Base.TreeAVL.Balance.Type
open import Base.TreeAVL.height
open import Base.Nat.Type
open import Base.Nat.eq
open import Base.Nat.sub
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Maybe.Type

-- Checks if an AVL tree is balanced.
-- - tree: The AVL tree to check.
-- = Some height if the tree is balanced, None otherwise.
is-balanced' : ∀ {K V : Set} -> AVL K V -> Maybe Nat
is-balanced' Leaf = Some Zero
is-balanced' (Node _ balance left right) with is-balanced' left | is-balanced' right
... | None | _    = None
... | _    | None = None
... | Some h-left | Some h-right with balance
...   | -one = if h-left  == Succ h-right then Some (Succ h-left)  else None
...   | zero = if h-left  == h-right      then Some (Succ h-left)  else None
...   | +one = if h-right == Succ h-left  then Some (Succ h-right) else None

-- Boolean return for the `is-balanced'` function
-- - tree: The AVL tree to check.
-- = True if the tree is balanced, False otherwise.
is-balanced : ∀ {K V : Set} -> AVL K V -> Bool
is-balanced tree with is-balanced' tree
... | Some _ = True
... | None   = False
