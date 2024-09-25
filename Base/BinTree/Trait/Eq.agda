module Base.BinTree.Trait.Eq where

import Base.BinTree.eq as BinTree
import Base.BinTree.neq as BinTree
import Base.Trait.Eq as Eq
open import Base.BinTree.Type

-- Provides an instance of the Eq trait for BinTree.
-- This allows BinTree to be used with equality operations.
instance
  EqTree : ∀ {A : Set} {{EqA : Eq.Eq A}} -> Eq.Eq (BinTree A)
  EqTree {{EqA}} = record
    { eq = BinTree.eq
    ; neq = BinTree.neq
    }
