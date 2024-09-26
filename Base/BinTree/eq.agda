module Base.BinTree.eq where

import Base.Trait.Eq as Eq
open import Base.BinTree.BinTree
open import Base.Bool.Bool
open import Base.Bool.and

-- Checks if two binary trees are equal.
-- 1st: The first tree to compare.
-- 2nd: The second tree to compare.
-- = True if the trees are equal, False otherwise.
eq : ∀ {A : Set} -> {{EqA : Eq.Eq A}} -> BinTree A -> BinTree A -> Bool
eq {{EqA}} Leaf            Leaf            = True
eq {{EqA}} (Node ax al ar) (Node bx bl br) = do
  let eq1 = (eq {{EqA}} al bl)
  let eq2 = (eq {{EqA}} ar br)
  Eq.eq {{EqA}} ax bx && eq1 && eq2
eq {{EqA}} _               _               = False

-- Infix operator for tree equality.
_==_ : ∀ {A : Set} -> {{EqA : Eq.Eq A}} -> BinTree A -> BinTree A -> Bool
_==_ = eq

infix 4 _==_
