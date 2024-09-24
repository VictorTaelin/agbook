module Base.BinTree.Trait.Eq where

import Base.Trait.Eq as Eq
import Base.BinTree.eq as BinTree
import Base.BinTree.neq as BinTree
open import Base.BinTree.Type

instance
  EqTree : ∀ {A : Set} {{EqA : Eq.Eq A}} -> Eq.Eq (BinTree A)
  EqTree {{EqA}} = record
    { eq = BinTree.eq
    ; neq = BinTree.neq
    }
