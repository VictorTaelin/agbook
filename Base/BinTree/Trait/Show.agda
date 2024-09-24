module Base.BinTree.Trait.Show where

import Base.Trait.Show as Show
import Base.BinTree.show as BinTree
open import Base.BinTree.Type

instance
  ShowTree : ∀ {A : Set} {{ShowA : Show.Show A}} -> Show.Show (BinTree A)
  ShowTree {{ShowA}} = record { to-string = BinTree.show }
