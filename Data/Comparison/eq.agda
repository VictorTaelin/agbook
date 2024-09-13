module Data.Comparison.eq where

open import Data.Comparison.Type
open import Data.Bool.Type
open import Data.Trait.Eq
open import Data.Trait.Eq public

instance
  EqComparison : Eq Comparison
  EqComparison = record
    { eq = eq-cmp
    ; neq = neq-cmp
    }
    where
      eq-cmp : Comparison → Comparison → Bool
      eq-cmp LT LT = True
      eq-cmp EQ EQ = True
      eq-cmp GT GT = True
      eq-cmp _  _  = False

      neq-cmp : Comparison → Comparison → Bool
      neq-cmp LT LT = False
      neq-cmp EQ EQ = False
      neq-cmp GT GT = False
      neq-cmp _  _  = True
