module Base.String.Ord where

open import Base.String.Type
open import Base.Trait.Ord
open import Base.String.lt
open import Base.String.lte
open import Base.String.gt
open import Base.String.gte

instance
  OrdString : Ord String
  OrdString = record
    { _<_  = lt
    ; _<=_ = lte
    ; _>_  = gt
    ; _>=_ = gte
    }
