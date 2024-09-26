module Base.List.Trait.Eq where

open import Base.List.List
import Base.List.eq as List
import Base.List.neq as List
import Base.Trait.Eq as Eq

instance
  EqList : ∀ {A : Set} {{EqA : Eq.Eq A}} -> Eq.Eq (List A)
  EqList {{EqA}} = record
    { eq = List.eq
    ; neq = List.neq
    }
