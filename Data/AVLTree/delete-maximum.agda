module Data.AVLTree.delete-maximum where

open import Data.AVLTree.Type
open import Data.AVLTree.empty
open import Data.AVLTree.Balance.Type
open import Data.AVLTree.Balance.rotate-right
open import Data.Trait.Ord
open import Data.Bool.Type
open import Data.Pair.Type
open import Data.Maybe.Type
open import Data.Function.case

-- returns the maximum element and true if the height decreased
delete-maximum : ∀ {A : Set} → {{OrdA : Ord A}} → AVLTree A → Pair (Pair (AVLTree A) (Maybe A)) Bool
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
