module Base.Int.eq where

open import Base.Trait.Eq
open import Base.Trait.Eq.from-ord
open import Base.Int.Type
open import Base.Int.Ord

-- Derives the Eq instance for Int from its Ord instance.
int-eq : Eq Int
int-eq = from-ord OrdInt
