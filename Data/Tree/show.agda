module Data.Tree.show where

open import Data.Tree.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show public

instance
  ShowTree : ∀ {A : Set} {{ShowA : Show A}} → Show (Tree A)
  ShowTree {{ShowA}} = record { to-string = show-tree }
    where
      show-tree : Tree _ → String
      show-tree Leaf = "_"
      show-tree (Node x l r) = "{" ++ to-string{{ShowA}} x ++ ", " ++ show l ++ ", " ++ show r ++ "}"