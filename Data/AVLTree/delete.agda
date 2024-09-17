module Data.AVLTree.delete where

open import Data.AVLTree.Type
open import Data.AVLTree.empty
open import Data.AVLTree.delete-maximum
open import Data.AVLTree.Balance.Type
open import Data.AVLTree.Balance.rotate-left
open import Data.AVLTree.Balance.rotate-right
open import Data.Trait.Ord
open import Data.Maybe.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Pair.Type
open import Data.Pair.map-snd
open import Data.Ordering.Type
open import Data.Function.case

-- Deletes a value from an AVL tree, maintaining balance.
-- - v: The value to delete.
-- - t: The AVL tree to delete from.
-- = A new AVL tree with the value deleted and balance maintained.
delete : ∀ {A : Set} → {{OrdA : Ord A}} → A → AVLTree A → AVLTree A
delete v t = Pair.fst (delete' v t) where
  -- returns True if the height decreased
  delete' : ∀ {A : Set} → {{OrdA : Ord A}} → A → AVLTree A → Pair (AVLTree A) Bool
  delete' _ Leaf = empty , False
  delete' v (Node curr balance left right) with compare v curr
  ... | EQ =
    case left of λ where
      Leaf → left , True
      _    →
        let ((other , deleted) , is-smaller) = delete-maximum left in
        case (deleted , is-smaller , balance) of λ where
          -- deleted == None cannot happen
          (None , _ , _) → Node curr balance left right , False
          (Some got , False , _   ) → Node got balance other right , False
          (Some got , True  , -one) → Node got zero    other right , True
          (Some got , True  , zero) → Node got +one    other right , False
          (Some got , True  , +one) → map-snd not (rotate-left (Node got +one other right))
  ... | LT =
    let (other , is-smaller) = delete' v left in
    case (is-smaller , balance) of λ where
      (False , _   ) → Node curr balance other right , False
      (True  , -one) → Node curr zero    other right , True
      (True  , zero) → Node curr +one    other right , False
      (True  , +one) → map-snd not (rotate-left (Node curr +one other right))
  ... | GT =
    let (other , is-smaller) = delete' v right in
    case (is-smaller , balance) of λ where
      (False , _   ) → Node curr balance left other , False
      (True  , +one) → Node curr zero    left other , True
      (True  , zero) → Node curr -one    left other , False
      (True  , -one) → map-snd not (rotate-right (Node curr -one left other))
