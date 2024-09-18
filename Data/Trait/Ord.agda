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
