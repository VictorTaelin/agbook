module Base.BinTree.Trait.Eq where

open import Base.BinTree.BinTree
import Base.BinTree.eq as BinTree
import Base.BinTree.neq as BinTree
import Base.Trait.Eq as Eq

-- Provides an instance of the Eq trait for BinTree.
-- This allows BinTree to be used with equality operations.
instance
  EqTree : ∀ {A : Set} {{EqA : Eq.Eq A}} -> Eq.Eq (BinTree A)
  EqTree {{EqA}} = Eq.make-eq BinTree.eq BinTree.neq
