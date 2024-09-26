module Base.Bool.Trait.Eq where

open import Base.Bool.Bool
import Base.Bool.eq as Bool
import Base.Bool.neq as Bool
import Base.Trait.Eq as Eq

instance
  EqBool : Eq.Eq Bool 
  EqBool = Eq.make-eq Bool.eq Bool.neq