module Base.Trait.Ord where

open import Agda.Primitive
open import Base.Bool.Type
open import Base.Bool.eq
open import Base.Bool.or
open import Base.Bool.and
open import Base.Bool.if
open import Base.Equal.Type
open import Base.Ordering.Type
open import Base.Ordering.eq

open import Base.Bool.not

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
