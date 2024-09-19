module Base.List.Ord where

open import Base.List.Type
open import Base.Ord.Trait public
open import Base.List.lt
open import Base.List.lte
open import Base.List.gt
open import Base.List.gte

instance
  OrdList : ∀ {A : Set} → {{O : Ord A}} → Ord (List A)
  OrdList {{O}} = record
    { _<_  = lt {{O}}
    ; _<=_ = lte {{O}}
    ; _>_  = gt {{O}}
    ; _>=_ = gte {{O}}
    }
