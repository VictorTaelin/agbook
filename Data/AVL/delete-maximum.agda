module Data.AVL.delete-maximum where

open import Data.AVL.Type
open import Data.AVL.empty
open import Data.AVL.Balance.Type
open import Data.AVL.Balance.rotate-right
open import Data.Trait.Ord
open import Data.Bool.Type
open import Data.Pair.Type
open import Data.Maybe.Type
open import Data.Function.case

-- Deletes the maximum element from an AVL tree, maintaining balance.
-- - tree: The AVL tree to delete from.
-- = A pair containing:
--   1. Another pair with:
--      a. The new AVL tree with the maximum element removed.
--      b. The maximum element that was removed (or None if the tree was empty).
--   2. A boolean indicating whether the height of the tree decreased.
delete-maximum : ∀ {A : Set} → {{OrdA : Ord A}} → AVL A → Pair (Pair (AVL A) (Maybe A)) Bool
delete-maximum Leaf = (empty , None) , False
delete-maximum (Node v    _       left Leaf)  = (left , Some v) , True
delete-maximum (Node curr balance left right) =
  let ((other , v) , is-smaller) = delete-maximum right in
  case (is-smaller , balance) of λ where
    (False , _   ) → (Node curr balance left other , v) , False
    (True  , +one) → (Node curr zero    left other , v) , True
    (True  , zero) → (Node curr -one    left other , v) , False
    (True  , -one) → let (node , height) = rotate-right (Node curr -one left other)
                     in  (node , v) , height
