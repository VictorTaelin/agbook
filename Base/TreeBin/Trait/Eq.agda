module Base.TreeBin.Trait.Eq where

import Base.Trait.Eq as Eq
import Base.TreeBin.eq as TreeBin
import Base.TreeBin.neq as TreeBin
open import Base.TreeBin.Type

instance
  EqTree : ∀ {A : Set} {{EqA : Eq.Eq A}} → Eq.Eq (TreeBin A)
  EqTree {{EqA}} = record
    { eq = TreeBin.eq
    ; neq = TreeBin.neq
    }
