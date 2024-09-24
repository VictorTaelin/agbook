module Base.List.Trait.Ord where

open import Base.List.Type
import Base.List.lt as List
import Base.List.gt as List
import Base.List.lte as List
import Base.List.gte as List
import Base.List.compare as List
import Base.Trait.Ord as Ord

instance
  OrdList : ∀ {A : Set} -> {{O : Ord.Ord A}} -> Ord.Ord (List A)
  OrdList {{O}} = record
    { compare = List.compare (Ord.compare {{O}})
    ; lt = List.lt
    ; gt = List.gt
    ; lte = List.lte
    ; gte = List.gte
    }
