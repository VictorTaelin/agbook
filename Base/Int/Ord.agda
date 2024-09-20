module Base.Int.Ord where

open import Base.Ord.Trait
open import Base.Ord.default-ord
open import Base.Ordering.Type
open import Base.Int.Type
import Base.Int.compare

-- Defines the total order for integers.
-- Uses the compare function to implement all operations.
instance
  OrdInt : Ord Int
  OrdInt = default-ord Base.Int.compare.compare
