module Base.Bool.Trait.Eq where

open import Base.Bool.Bool
import Base.Bool.eq as Bool
import Base.Bool.neq as Bool
open import Base.Trait.Eq

instance
  EqBool : Eq Bool
  EqBool = MkEq Bool.eq Bool.neq
