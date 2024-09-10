module Data.Tree.show where

open import Data.Tree.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show

instance
  ShowTree : ∀ {A : Set} {{ShowA : Show A}} → Show (Tree A)
  ShowTree {{ShowA}} = record { toString = showTree }
    where
      showTree : Tree _ → String
      showTree Leaf = "Leaf"
      showTree (Node x l r) = "Node(" ++ show x ++ ", " ++ show l ++ ", " ++ show r ++ ")"

-- Tests
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Equal.Type

_ : show (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) === "Node(2, Node(1, Leaf, Leaf), Node(3, Leaf, Leaf))"
_ = refl