module Base.BinTree.neq where

import Base.Trait.Eq as Eq
import Base.BinTree.eq as BinTree
open import Base.Bool.not
open import Base.Bool.Type
open import Base.BinTree.Type

neq : ∀ {A : Set} -> {{EqA : Eq.Eq A}} -> BinTree A -> BinTree A -> Bool
neq t1 t2 = not (BinTree.eq t1 t2)

infix 4 _!=_
_!=_ : ∀ {A : Set} -> {{EqA : Eq.Eq A}} -> BinTree A -> BinTree A -> Bool
_!=_ = neq
