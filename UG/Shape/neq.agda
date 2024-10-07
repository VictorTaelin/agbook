module UG.Shape.neq where

open import Base.Bool.Bool
open import Base.Bool.not
open import UG.Shape.Shape
open import UG.Shape.eq

neq : Shape → Shape → Bool
neq s1 s2 = not (s1 == s2)

infix 4 _!=_
_!=_ : Shape → Shape → Bool
_!=_ = neq

