module Base.AVL.delete where

open import Base.AVL.Type
open import Base.AVL.empty
open import Base.AVL.delete-maximum
open import Base.AVL.Balance.Type
open import Base.AVL.Balance.rotate-left
open import Base.AVL.Balance.rotate-right
open import Base.Trait.Ord
open import Base.Maybe.Type
open import Base.Bool.Type
open import Base.Bool.not
open import Base.Pair.Type
open import Base.Pair.map
open import Base.Pair.get-fst
open import Base.Ordering.Type
open import Base.Function.case

-- Deletes a value from an AVL tree, maintaining balance.
-- - v: The value to delete.
-- - t: The AVL tree to delete from.
-- = A new AVL tree with the value deleted and balance maintained.
delete : ∀ {A : Set} → {{OrdA : Ord A}} → A → AVL A → AVL A
delete v t = get-fst (delete' v t) where
  -- returns True if the height decreased
  delete' : ∀ {A : Set} → {{OrdA : Ord A}} → A → AVL A → Pair (AVL A) Bool
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
          (Some got , True  , +one) → map (λ x → x) (λ _ → not) (rotate-left (Node got +one other right))
  ... | LT =
    let (other , is-smaller) = delete' v left in
    case (is-smaller , balance) of λ where
      (False , _   ) → Node curr balance other right , False
      (True  , -one) → Node curr zero    other right , True
      (True  , zero) → Node curr +one    other right , False
      (True  , +one) → map (λ x → x) (λ _ → not) (rotate-left (Node curr +one other right))
  ... | GT =
    let (other , is-smaller) = delete' v right in
    case (is-smaller , balance) of λ where
      (False , _   ) → Node curr balance left other , False
      (True  , +one) → Node curr zero    left other , True
      (True  , zero) → Node curr -one    left other , False
      (True  , -one) → map (λ x → x) (λ _ → not) (rotate-right (Node curr -one left other))
