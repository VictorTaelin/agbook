module Base.Ordering.Trait.Eq where

open import Base.Ordering.Ordering
import Base.Ordering.eq as Ordering
import Base.Ordering.neq as Ordering
open import Base.Trait.Eq

instance
  EqOrdering : Eq Ordering
  EqOrdering = MkEq Ordering.eq Ordering.neq
