module Base.Tree.show where

open import Base.Tree.Type
open import Base.String.Type
open import Base.String.append
open import Base.Show.Trait public

instance
  ShowTree : ∀ {A : Set} {{ShowA : Show A}} → Show (Tree A)
  ShowTree {{ShowA}} = record { to-string = show-tree }
    where
      show-tree : Tree _ → String
      show-tree Leaf = "_"
      show-tree (Node x l r) = "{" ++ to-string{{ShowA}} x ++ ", " ++ show l ++ ", " ++ show r ++ "}"