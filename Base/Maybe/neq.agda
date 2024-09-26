module Base.Maybe.neq where

open import Base.Maybe.Maybe
open import Base.Bool.Bool
open import Base.Bool.not
import Base.Maybe.eq as Maybe
import Base.Trait.Eq as Eq

neq : ∀ {A : Set} -> {{EqA : Eq.Eq A}} -> Maybe A -> Maybe A -> Bool
neq {{EqA}} x y = not (Maybe.eq {{EqA}} x y)

infix 4 _!=_
_!=_ : ∀ {A : Set} -> {{EqA : Eq.Eq A}} -> Maybe A -> Maybe A -> Bool
_!=_ = neq
