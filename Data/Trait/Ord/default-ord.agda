module Data.Trait.Ord.default-ord where

open import Data.Trait.Ord
open import Data.Ordering.Type
open import Data.Ordering.eq
open import Data.Bool.or

-- Creates a default Ord instance given a compare function.
-- - cmp: The comparison function to use.
-- = An Ord instance with default implementations for <, >, <=, and >=.
default-ord : ∀ {A : Set} → (A → A → Ordering) → Ord A
default-ord cmp = record
  { compare = cmp
  ; _<_ = λ x y → cmp x y == LT
  ; _>_ = λ x y → cmp x y == GT
  ; _<=_ = λ x y → let c = cmp x y in (c == GT) || (c == EQ)
  ; _>=_ = λ x y → let c = cmp x y in (c == LT) || (c == EQ)
  }
