module Base.Ordering.Trait.Eq where

open import Base.Ordering.Ordering
import Base.Ordering.eq as Ordering
import Base.Ordering.neq as Ordering
import Base.Trait.Eq as Eq

instance
  EqOrdering : Eq.Eq Ordering
  EqOrdering = Eq.make-eq Ordering.eq Ordering.neq
