module Data.AVL.delete where

open import Data.AVL.Type
open import Data.AVL.empty
open import Data.AVL.delete-maximum
open import Data.AVL.Balance.Type
open import Data.AVL.Balance.rotate-left
open import Data.AVL.Balance.rotate-right
open import Data.Trait.Ord
open import Data.Maybe.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Pair.Type
open import Data.Pair.map-snd
open import Data.Ordering.Type
open import Data.Function.case

-- Deletes a key-value pair from an AVL tree, maintaining balance.
-- - k: The key to delete.
-- - t: The AVL tree to delete from.
-- = A new AVL tree with the value deleted and balance maintained.
delete : ∀ {K V : Set} → {{_ : Ord K}} → K → AVL K V → AVL K V
delete k t = Pair.fst (delete' k t) where
  -- returns True if the height decreased
  delete' : ∀ {K V : Set} → {{_ : Ord K}} → K → AVL K V → Pair (AVL K V) Bool
  delete' _ Leaf = empty , False
  delete' k (Node (curr-key , curr-val) balance left right) with compare k curr-key
  ... | EQ =
    case left of λ where
      Leaf → left , True
      _    →
        let (deleted , other , is-smaller) = delete-maximum left in
        case (deleted , is-smaller , balance) of λ where
          -- deleted == None cannot happen
          (None , _ , _) → Node (curr-key , curr-val) balance left right , False
          (Some got , False , _   ) → Node got balance other right , False
          (Some got , True  , -one) → Node got zero    other right , True
          (Some got , True  , zero) → Node got +one    other right , False
          (Some got , True  , +one) → map-snd not (rotate-left (Node got +one other right))
  ... | LT =
    let (other , is-smaller) = delete' k left in
    case (is-smaller , balance) of λ where
      (False , _   ) → Node (curr-key , curr-val) balance other right , False
      (True  , -one) → Node (curr-key , curr-val) zero    other right , True
      (True  , zero) → Node (curr-key , curr-val) +one    other right , False
      (True  , +one) → map-snd not (rotate-left (Node (curr-key , curr-val) +one other right))
  ... | GT =
    let (other , is-smaller) = delete' k right in
    case (is-smaller , balance) of λ where
      (False , _   ) → Node (curr-key , curr-val) balance left other , False
      (True  , +one) → Node (curr-key , curr-val) zero    left other , True
      (True  , zero) → Node (curr-key , curr-val) -one    left other , False
      (True  , -one) → map-snd not (rotate-right (Node (curr-key , curr-val) -one left other))
