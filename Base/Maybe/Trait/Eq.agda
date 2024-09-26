module Base.Maybe.Trait.Eq where

open import Base.Maybe.Maybe
import Base.Maybe.eq as Maybe
import Base.Maybe.neq as Maybe
import Base.Trait.Eq as Eq

instance
  EqMaybe : ∀ {A : Set} -> {{EqA : Eq.Eq A}} -> Eq.Eq (Maybe A)
  EqMaybe {{EqA}} = Eq.make-eq Maybe.eq Maybe.neq
