module Base.Ordering.eq where

open import Base.Ordering.Type
open import Base.Bool.Type
open import Base.Trait.Eq
open import Base.Trait.Eq public

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
