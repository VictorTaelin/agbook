module Data.AVLTree.Balance.rotate-right where

open import Data.AVLTree.Type
open import Data.AVLTree.empty
open import Data.AVLTree.Balance.Type
open import Data.AVLTree.Balance.eq
open import Data.Pair.Type
open import Data.Bool.Type
open import Data.Bool.if

-- Performs a right rotation on an AVL tree to fix an imbalance of -2.
-- - tree: The AVL tree to rotate.
-- = A pair containing the rotated AVL tree and a boolean indicating if the height of the root stayed the same.
rotate-right : ∀ {A : Set} → AVLTree A → Pair (AVLTree A) Bool
rotate-right
     (Node v₁ -one
        (Node v₂ -one
          child-left
          child-right)
        right)
    = Node v₂ zero
        child-left 
        (Node v₁ zero
          child-right
          right)
      , False

rotate-right
     (Node v₁ -one
        (Node v₂ zero
          child-left
          child-right)
        right)
    = Node v₂ +one
        child-left
        (Node v₁ -one
          child-right
          right)
      , True

rotate-right
     (Node v₁ -one
        (Node v₂ +one child-left
          (Node v₃ balance
            child-child-left
            child-child-right))
        right)
    = let b₁ = if balance == +one then -one else zero
          b₂ = if balance == -one then +one else zero in
      Node v₃ zero
        (Node v₂ b₁
          child-left
          child-child-left)
        (Node v₁ b₂
          child-child-right
          right)
      , False

-- Invalid call to `rotate-right`
rotate-right tree = tree , False
