module Base.Int.Trait.Eq where

open import Base.Int.Int
import Base.Int.eq as Int
import Base.Int.neq as Int
import Base.Trait.Eq as Eq

instance
  EqInt : Eq.Eq Int
  EqInt = Eq.make-eq Int.eq Int.neq
