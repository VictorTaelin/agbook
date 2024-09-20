module Base.Tree.Trait.Show where

open import Base.Tree.Type
import Base.Tree.show as Tree
import Base.Trait.Show as Show

instance
  ShowTree : ∀ {A : Set} {{ShowA : Show.Show A}} → Show.Show (Tree A)
  ShowTree {{ShowA}} = record { to-string = Tree.show }
