module Base.Ordering.Trait.Eq where

open import Base.Ordering.Type
import Base.Ordering.eq as Ordering
import Base.Ordering.neq as Ordering
import Base.Trait.Eq as Eq

instance
  EqOrdering : Eq.Eq Ordering
  EqOrdering = record
    { eq = Ordering.eq
    ; neq = Ordering.neq
    }
