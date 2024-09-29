module Base.BinTree.neq where

import Base.BinTree.eq as BinTree
import Base.Trait.Eq as Eq
open import Base.BinTree.BinTree
open import Base.Bool.Bool
open import Base.Bool.not

-- Checks if two binary trees are not equal.
-- 1st: The first tree to compare.
-- 2nd: The second tree to compare.
-- = True if the trees are not equal, False otherwise.
neq : ∀ {A : Set} → {{EqA : Eq.Eq A}} → BinTree A → BinTree A → Bool
neq t1 t2 = not (BinTree.eq t1 t2)

-- Infix operator for tree inequality.
_!=_ : ∀ {A : Set} → {{EqA : Eq.Eq A}} → BinTree A → BinTree A → Bool
_!=_ = neq

infix 4 _!=_
