module Base.Maybe.eq where

open import Base.Maybe.Type
open import Base.Bool.Type
import Base.Trait.Eq as Eq

eq : ∀ {A : Set} → {{EqA : Eq.Eq A}} → Maybe A → Maybe A → Bool
eq {{EqA}} None     None     = True
eq {{EqA}} (Some x) (Some y) = Eq.eq {{EqA}} x y
eq {{EqA}} _        _        = False

infix 4 _==_
_==_ : ∀ {A : Set} → {{EqA : Eq.Eq A}} → Maybe A → Maybe A → Bool
_==_ = eq
