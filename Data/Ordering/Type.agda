module Data.Ordering.Type where

open import Data.Equal.Type

data Ordering : Set where
  LT : Ordering
  EQ : Ordering
  GT : Ordering
