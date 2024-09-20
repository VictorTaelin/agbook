module Base.List.neq where

open import Base.List.Type
open import Base.Bool.Type
open import Base.Bool.not
import Base.Trait.Eq as Eq
import Base.List.eq as List

neq : ∀ {A : Set} → {{EqA : Eq.Eq A}} → List A → List A → Bool
neq xs ys = not (List.eq xs ys)

infix 4 _!=_
_!=_ : ∀ {A : Set} → {{EqA : Eq.Eq A}} → List A → List A → Bool
_!=_ = neq
