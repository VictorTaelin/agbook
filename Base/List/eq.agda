module Base.List.eq where

open import Base.List.Type
open import Base.Bool.Type
open import Base.Bool.and
import Base.Trait.Eq as Eq

eq : ∀ {A : Set} → {{EqA : Eq.Eq A}} → List A → List A → Bool
eq {{EqA}} []        []        = True
eq {{EqA}} (x :: xs) (y :: ys) = Eq.eq {{EqA}} x y && eq xs ys
eq {{EqA}} _         _         = False
