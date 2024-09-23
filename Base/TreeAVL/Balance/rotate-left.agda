module Base.TreeAVL.Balance.rotate-left where

open import Base.TreeAVL.Type
open import Base.TreeAVL.empty
open import Base.TreeAVL.Balance.Type
open import Base.TreeAVL.Balance.eq
open import Base.Pair.Type
open import Base.Bool.Type
open import Base.Bool.if

-- Performs a left rotation on an AVL tree to fix an imbalance of +2.
-- - tree: The AVL tree to rotate.
-- = A pair containing the rotated AVL tree and a boolean indicating if the height of the root stayed the same.
rotate-left : ∀ {K V : Set} → AVL K V → Pair (AVL K V) Bool
rotate-left
   (Node v₁ +one
      left
      (Node v₂ +one
        child-left
        child-right))
  = Node v₂ zero
      (Node v₁ zero
        left
        child-left)
      child-right
  , False

rotate-left
   (Node v₁ +one
      left
      (Node v₂ zero
        child-left
        child-right))
  = Node v₂ -one
      (Node v₁ +one
        left
        child-left)
      child-right
  , True

rotate-left
   (Node v₁ +one
      left
      (Node v₂ -one
        (Node v₃ balance
          child-child-left
          child-child-right)
        child-right))
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
rotate-left tree = tree , False
