module Base.Int.Trait.Ord where

open import Base.Trait.Ord
open import Base.Ordering.Type
open import Base.Int.Type
import Base.Int.compare

-- Defines the total order for integers.
-- Uses the compare function to implement all operations.
instance
  OrdInt : Ord Int
  OrdInt = make-ord Base.Int.compare.compare
