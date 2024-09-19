module Base.Ordering.Type where

open import Base.Equal.Type

data Ordering : Set where
  LT : Ordering
  EQ : Ordering
  GT : Ordering
