module Base.BinTree.Trait.Show where

import Base.BinTree.show as BinTree
import Base.Trait.Show as Show
open import Base.BinTree.Type

instance
  ShowTree : ∀ {A : Set} {{ShowA : Show.Show A}} -> Show.Show (BinTree A)
  ShowTree {{ShowA}} = record { to-string = BinTree.show }
