module Base.TreeBin.Trait.Show where

import Base.Trait.Show as Show
import Base.TreeBin.show as TreeBin
open import Base.TreeBin.Type

instance
  ShowTree : ∀ {A : Set} {{ShowA : Show.Show A}} → Show.Show (TreeBin A)
  ShowTree {{ShowA}} = record { to-string = TreeBin.show }
