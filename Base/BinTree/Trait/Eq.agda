module Base.BinTree.Trait.Eq where

open import Base.BinTree.BinTree
import Base.BinTree.eq as BinTree
import Base.BinTree.neq as BinTree
open import Base.Trait.Eq

-- Provides an instance of the Eq trait for BinTree.
-- This allows BinTree to be used with equality operations.
instance
  EqTree : ∀ {A : Set} {{EqA : Eq A}} → Eq (BinTree A)
  EqTree = MkEq BinTree.eq BinTree.neq

