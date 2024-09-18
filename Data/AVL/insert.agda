module Data.AVL.insert where

open import Data.AVL.Type
open import Data.AVL.empty
open import Data.AVL.Balance.Type
open import Data.AVL.Balance.rotate-left
open import Data.AVL.Balance.rotate-right
open import Data.Trait.Ord
open import Data.Bool.Type
open import Data.Pair.Type
open import Data.Ordering.Type
open import Data.Function.case

-- Inserts a value into an AVL tree, maintaining balance.
-- - v: The value to insert.
-- - t: The AVL tree to insert into.
-- = A new AVL tree with the value inserted and balance maintained.
insert : ∀ {A : Set} → {{OrdA : Ord A}} → A → AVL A → AVL A
insert v t = Pair.fst (insert' v t) where
  -- returns True if the height increased
  insert' : ∀ {A : Set} → {{OrdA : Ord A}} → A → AVL A → Pair (AVL A) Bool
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

-- Infix notation for inserting an element into an AVL tree.
-- - x: The value to insert.
-- - t: The AVL tree to insert into.
-- = A new AVL tree with the value inserted and balance maintained.
_::>_ : ∀ {A : Set} → {{OrdA : Ord A}} → A → AVL A → AVL A
_::>_ = insert

infixr 5 _::>_
