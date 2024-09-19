module Base.String.Ord where

open import Base.String.Type
open import Base.String.compare as S
open import Base.Ord.Trait
open import Base.String.lt
open import Base.String.lte
open import Base.String.gt
open import Base.String.gte

instance
  OrdString : Ord String
  OrdString = record
    { compare = S.compare
    ; _<_     = lt
    ; _<=_    = lte
    ; _>_     = gt
    ; _>=_    = gte
    }
