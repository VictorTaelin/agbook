module Base.Trait.Eq.from-ord where

open import Base.Trait.Eq
open import Base.Trait.Ord
open import Base.Ordering.Type
open import Base.Ordering.eq

-- Creates an Eq instance from an Ord instance.
-- - ord: The Ord instance to derive equality from.
-- = An Eq instance where equality is determined by comparing elements.
from-ord : ∀ {A : Set} → Ord A → Eq A
from-ord ord = record
  { eq = λ x y → Ord.compare ord x y == EQ
  ; neq = λ x y → Ord.compare ord x y != EQ
  }
