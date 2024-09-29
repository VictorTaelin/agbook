module Base.Int.Trait.Eq where

open import Base.Int.Int
import Base.Int.eq as Int
import Base.Int.neq as Int
open import Base.Trait.Eq

instance
  EqInt : Eq Int
  EqInt = MkEq Int.eq Int.neq
