module Data.Ordering.eq where

open import Data.Ordering.Type
open import Data.Bool.Type
open import Data.Trait.Eq
open import Data.Trait.Eq public

instance
  EqOrdering : Eq Ordering
  EqOrdering = record
    { eq = eq-cmp
    ; neq = neq-cmp
    }
    where
      eq-cmp : Ordering → Ordering → Bool
      eq-cmp LT LT = True
      eq-cmp EQ EQ = True
      eq-cmp GT GT = True
      eq-cmp _  _  = False

      neq-cmp : Ordering → Ordering → Bool
      neq-cmp LT LT = False
      neq-cmp EQ EQ = False
      neq-cmp GT GT = False
      neq-cmp _  _  = True
