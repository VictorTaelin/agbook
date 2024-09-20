module Base.Map.Trait.Show where

open import Base.Map.Type
import Base.Map.show as Map
import Base.Trait.Show as Show

instance
  ShowMap : ∀ {A : Set} {{ShowA : Show.Show A}} → Show.Show (Map A)
  ShowMap {{ShowA}} = record { to-string = Map.show Show.to-string }
