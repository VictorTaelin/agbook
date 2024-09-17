module Data.AVLTree.insert where

open import Data.AVLTree.Type
open import Data.AVLTree.empty
open import Data.AVLTree.Balance.Type
open import Data.AVLTree.Balance.rotate-left
open import Data.AVLTree.Balance.rotate-right
open import Data.Trait.Ord
open import Data.Bool.Type
open import Data.Pair.Type
open import Data.Ordering.Type
open import Data.Function.case

insert : ∀ {A : Set} → {{OrdA : Ord A}} → A → AVLTree A → AVLTree A
insert v t = Pair.fst (insert' v t) where
  -- returns True if the height increased
  insert' : ∀ {A : Set} → {{OrdA : Ord A}} → A → AVLTree A → Pair (AVLTree A) Bool
  insert' v Leaf = Node v zero empty empty , True
  insert' v (Node curr balance left right) with compare v curr
  ... | EQ = Node curr balance left right , False
  ... | LT =
    let (other , is-higher) = insert' v left in
    case (is-higher , balance) of λ where
      (False , _   ) → Node curr balance other right , False
      (True  , +one) → Node curr zero    other right , False
      (True  , zero) → Node curr -one    other right , True
      (True  , -one) → rotate-right (Node curr -one other right)
  ... | GT =
    let (other , is-higher) = insert' v right in
    case (is-higher , balance) of λ where
      (False , _   ) → Node curr balance left other , False
      (True  , -one) → Node curr zero    left other , False
      (True  , zero) → Node curr +one    left other , True
      (True  , +one) → rotate-left (Node curr +one left other)
 