module Base.Pair.eq where

open import Base.Pair.Pair
open import Base.Bool.Bool
open import Base.Bool.and
import Base.Trait.Eq as Eq

eq : ∀ {A B : Set} -> {{EqA : Eq.Eq A}} -> {{EqB : Eq.Eq B}} -> Pair A B -> Pair A B -> Bool
eq {{EqA}} {{EqB}} (a₁ , a₂) (b₁ , b₂) = Eq.eq {{EqA}} a₁ b₁ && Eq.eq {{EqB}} a₂ b₂

infix 4 _==_
_==_ : ∀ {A B : Set} -> {{EqA : Eq.Eq A}} -> {{EqB : Eq.Eq B}} -> Pair A B -> Pair A B -> Bool
_==_ = eq
