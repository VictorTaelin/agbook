module Data.Tree.show where

open import Data.Tree.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show

instance
  ShowTree : ∀ {A : Set} {{ShowA : Show A}} → Show (Tree A)
  ShowTree {{ShowA}} = record { to-string = show-tree }
    where
      show-tree : Tree _ → String
      show-tree Leaf = "Leaf"
      show-tree (Node x l r) = "Node(" ++ to-string{{ShowA}} x ++ ", " ++ to-string{{ShowA}} l ++ ", " ++ to-string{{ShowA}} r ++ ")"