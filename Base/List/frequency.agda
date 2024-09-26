module Base.List.frequency where

open import Base.List.List
open import Base.List.foldr
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.AVLTree.AVLTree
open import Base.AVLTree.empty
open import Base.AVLTree.insert
open import Base.AVLTree.get-pair
open import Base.Maybe.Maybe

frequency : ∀ {A : Set} -> {{_ : Ord A}} -> List A -> AVLTree A Nat
frequency xs = foldr count-element empty xs where
  count-element : ∀ {A : Set} -> {{_ : Ord A}} -> A → AVLTree A Nat -> AVLTree A Nat
  count-element x tree with get-pair x tree
  ... | Some (k , v) = (k , Succ v) ::> tree
  ... | None         = (x , Succ Zero) ::> tree
