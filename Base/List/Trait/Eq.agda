module Base.List.Trait.Eq where

open import Base.List.List
import Base.List.eq as List
import Base.List.neq as List
open import Base.Trait.Eq

instance
  EqList : ∀ {A : Set} {{EqA : Eq A}} → Eq (List A)
  EqList = MkEq List.eq List.neq

