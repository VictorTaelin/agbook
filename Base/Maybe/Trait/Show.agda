module Base.Maybe.Trait.Show where

open import Base.Maybe.Maybe
import Base.Maybe.show as Maybe
import Base.Trait.Show as Show

instance
  ShowMaybe : ∀ {A : Set} → {{ShowA : Show.Show A}} → Show.Show (Maybe A)
  ShowMaybe {{ShowA}} = record { to-string = Maybe.show {{ShowA}} }

