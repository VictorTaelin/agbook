module Data.Comparison.Type where

open import Data.Equal.Type

data Comparison : Set where
  LT : Comparison
  EQ : Comparison
  GT : Comparison
