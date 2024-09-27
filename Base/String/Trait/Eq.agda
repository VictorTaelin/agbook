module Base.String.Trait.Eq where

open import Base.String.String
import Base.String.eq as String
import Base.String.neq as String
import Base.Trait.Eq as Eq

instance
  EqString : Eq.Eq String
  EqString = Eq.make-eq String.eq String.neq
