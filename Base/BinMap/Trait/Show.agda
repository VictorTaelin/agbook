module Base.BinMap.Trait.Show where

open import Base.BinMap.BinMap
import Base.BinMap.show as BinMap
import Base.Trait.Show as Show

instance
  ShowMap : ∀ {A : Set} {{ShowA : Show.Show A}} → Show.Show (BinMap A)
  ShowMap {{ShowA}} = record { to-string = BinMap.show Show.to-string }

