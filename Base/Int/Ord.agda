module Base.Int.Ord where

open import Base.Ord.Trait
open import Base.Ordering.Type
open import Base.Int.Type
open import Base.Int.compare renaming (compare to compare-int)
open import Base.Int.lt
open import Base.Int.gt
open import Base.Int.lte
open import Base.Int.gte

-- Defines the total order for integers.
-- Uses the compare function to implement all operations.
instance
  OrdInt : Ord Int
  OrdInt = record
    { compare = compare-int
    ; _<_  = lt
    ; _>_  = gt
    ; _<=_ = lte
    ; _>=_ = gte
    }
