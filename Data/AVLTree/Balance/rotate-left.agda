module Data.AVLTree.Balance.rotate-left where

open import Data.AVLTree.Type
open import Data.AVLTree.empty
open import Data.AVLTree.Balance.Type
open import Data.AVLTree.Balance.eq
open import Data.Pair.Type
open import Data.Bool.Type
open import Data.Bool.if

-- fixes imbalance of 2, returns True if height of root stayed the same
rotate-left : ∀ {A : Set} → AVLTree A → Pair (AVLTree A) Bool
rotate-left tree with tree
... | Node v₁ +one
        left
        (Node v₂ +one
          child-left
          child-right)
    = Node v₂ zero
        (Node v₁ zero
          left
          child-left)
        child-right
    , False

... | Node v₁ +one
        left
        (Node v₂ zero
          child-left
          child-right)
    = Node v₂ -one
        (Node v₁ +one
          left
          child-left)
        child-right
    , True

... | Node v₁ +one
        left
        (Node v₂ -one
          (Node v₃ balance
            child-child-left
            child-child-right)
          child-right)
    = let b₁ = if balance == +one then -one else zero
          b₂ = if balance == -one then +one else zero in
      Node v₃ zero
        (Node v₁ b₁
          left
          child-child-left)
        (Node v₂ b₂
          child-child-right
          child-right)
      , False

-- Invalid call to `rotate-left`
... | _ = tree , False
