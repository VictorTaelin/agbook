module Base.TreeAVL.delete-maximum where

open import Base.Bool.Type
open import Base.Function.case
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.Trait.Ord
open import Base.TreeAVL.Balance.rotate-right
open import Base.TreeAVL.Balance.Type
open import Base.TreeAVL.empty
open import Base.TreeAVL.Type

-- Deletes the maximum element from an AVL tree, maintaining balance.
-- - tree: The AVL tree to delete from.
-- = A pair containing:
--   1. Another pair with:
--      a. The new AVL tree with the maximum element removed.
--      b. The maximum key-value pair that was removed (or None if the tree was empty).
--   2. A boolean indicating whether the height of the tree decreased.
delete-maximum : ∀ {K V : Set} → {{_ : Ord K}} → AVL K V → Pair (Maybe (Pair K V)) (Pair (AVL K V) Bool) 
delete-maximum Leaf = None , empty , False
delete-maximum (Node v    _       left Leaf)  = Some v , left , True
delete-maximum (Node curr balance left right) =
  let (v , other , is-smaller) = delete-maximum right in
  case (is-smaller , balance) of λ where
    (False , _   ) → v , (Node curr balance left other) , False
    (True  , +one) → v , (Node curr zero    left other) , True
    (True  , zero) → v , (Node curr -one    left other) , False
    (True  , -one) → let (node , height) = rotate-right (Node curr -one left other)
                     in  v , node , height
