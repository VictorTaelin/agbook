module Data.Trait.Ord where

open import Agda.Primitive
open import Data.Bool.Type
open import Data.Bool.eq
open import Data.Bool.or
open import Data.Bool.and
open import Data.Bool.if
open import Data.Equal.Type
open import Data.Ordering.Type
open import Data.Ordering.eq

open import Data.Bool.not

-- Defines the a total order trait for types.
-- - A: The type for the total order.
record Ord {a} (A : Set a) : Set (lsuc a) where
  infix 4 _<_ _>_ _<=_ _>=_
  field
    -- Compares two values of type A.
    -- = LT if first < second, EQ if equal, GT if first > second.
    compare : A → A → Ordering
    
    -- Less than operation.
    _<_ : A → A → Bool
    
    -- Greater than operation.
    _>_ : A → A → Bool
    
    -- Less than or equal to operation.
    _<=_ : A → A → Bool
    
    -- Greater than or equal to operation.
    _>=_ : A → A → Bool

open Ord {{...}} public

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

-- Creates a default Ord instance given a less-than function and Eq instance.
-- - lt: The less-than function to use.
-- = An Ord instance with implementations derived from lt and equality.
default-ord-lt-eq : ∀ {A : Set} → {{EqA : Eq A}} → (A → A → Bool) → Ord A
default-ord-lt-eq lt = record
  { _<_ = lt
  ; _>_ = λ x y → (not (lt x y)) && (x != y)
  ; _<=_ = λ x y → (lt x y) || (x == y)
  ; _>=_ = λ x y → not (lt x y)
  ; compare = λ x y →
    if lt x y
      then LT
    else if x == y
      then EQ
    else GT
  }
