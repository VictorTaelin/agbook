module Data.Trait.Eq.from-ord where

open import Data.Trait.Eq
open import Data.Trait.Ord
open import Data.Ordering.Type
open import Data.Ordering.eq

-- Creates an Eq instance from an Ord instance.
-- - ord: The Ord instance to derive equality from.
-- = An Eq instance where equality is determined by comparing elements.
from-ord : ∀ {A : Set} → Ord A → Eq A
from-ord ord = record
  { eq = λ x y → Ord.compare ord x y == EQ
  ; neq = λ x y → Ord.compare ord x y != EQ
  }
