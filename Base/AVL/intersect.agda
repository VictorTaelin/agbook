module Base.AVL.intersect where

open import Base.AVL.Type
open import Base.AVL.empty
open import Base.AVL.insert
open import Base.AVL.has-key
open import Base.AVL.get
open import Base.Ord.Trait
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.Pair.get-fst
open import Base.Pair.get-snd
open import Base.Bool.if

-- Computes the intersection of two AVL trees.
-- - t₁: The first AVL tree.
-- - t₂: The second AVL tree.
-- = A new AVL tree containing only the key-value pairs present in both input trees.
intersect : ∀ {K V : Set} → {{_ : Ord K}} → AVL K V → AVL K V → AVL K V
intersect t₁ t₂ = intersect' t₁ t₂ empty
  where
    intersect' : ∀ {K V : Set} → {{_ : Ord K}} → AVL K V → AVL K V → AVL K V → AVL K V
    intersect' Leaf _ acc = acc
    intersect' (Node (k , v) _ left right) t₂ acc =
      let acc' = if has-key k t₂
                 then (k , v) ::> acc
                 else acc
      in intersect' right t₂ (intersect' left t₂ acc')

-- Infix notation for intersecting two AVL trees.
-- - t₁: The first AVL tree.
-- - t₂: The second AVL tree.
-- = A new AVL tree containing only the key-value pairs present in both input trees.
_∩_ : ∀ {K V : Set} → {{_ : Ord K}} → AVL K V → AVL K V → AVL K V
_∩_ = intersect

infixr 6 _∩_
