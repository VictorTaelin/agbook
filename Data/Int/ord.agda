module Data.Int.ord where

open import Data.Trait.Ord public
open import Data.Ordering.Type
open import Data.Int.Type
open import Data.Int.compare renaming (compare to compare-int)
open import Data.Int.lt
open import Data.Int.gt
open import Data.Int.lte
open import Data.Int.gte

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
