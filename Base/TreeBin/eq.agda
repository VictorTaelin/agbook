module Base.TreeBin.eq where

import Base.Trait.Eq as Eq
open import Base.Bool.and
open import Base.Bool.Type
open import Base.TreeBin.Type

eq : ∀ {A : Set} -> {{EqA : Eq.Eq A}} -> TreeBin A -> TreeBin A -> Bool
eq {{EqA}} Leaf            Leaf            = True
eq {{EqA}} (Node ax al ar) (Node bx bl br) = Eq.eq {{EqA}} ax bx && (eq {{EqA}} al bl && eq {{EqA}} ar br)
eq {{EqA}} _               _               = False

infix 4 _==_
_==_ : ∀ {A : Set} -> {{EqA : Eq.Eq A}} -> TreeBin A -> TreeBin A -> Bool
_==_ = eq
