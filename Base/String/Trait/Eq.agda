module Base.String.Trait.Eq where

open import Base.String.String
import Base.String.eq as String
import Base.String.neq as String
open import Base.Trait.Eq

instance
  EqString : Eq String
  EqString = MkEq String.eq String.neq
