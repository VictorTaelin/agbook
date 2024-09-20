module Base.Tree.eq where

open import Base.Tree.Type
open import Base.Bool.Type
open import Base.Bool.and
import Base.Trait.Eq as Eq

eq : ∀ {A : Set} → {{EqA : Eq.Eq A}} → Tree A → Tree A → Bool
eq {{EqA}} Leaf            Leaf            = True
eq {{EqA}} (Node ax al ar) (Node bx bl br) = Eq.eq {{EqA}} ax bx && (eq {{EqA}} al bl && eq {{EqA}} ar br)
eq {{EqA}} _               _               = False

infix 4 _==_
_==_ : ∀ {A : Set} → {{EqA : Eq.Eq A}} → Tree A → Tree A → Bool
_==_ = eq
