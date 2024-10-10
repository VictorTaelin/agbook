module Base.Maybe.Trait.Eq where

open import Base.Maybe.Maybe
import Base.Maybe.eq as Maybe
import Base.Maybe.neq as Maybe
open import Base.Trait.Eq

instance
  EqMaybe : ∀ {A : Set} {{EqA : Eq A}} → Eq (Maybe A)
  EqMaybe = MkEq Maybe.eq Maybe.neq

