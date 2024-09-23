module Base.BitMap.Trait.Show where

open import Base.BitMap.Type
import Base.BitMap.show as BitMap
import Base.Trait.Show as Show

instance
  ShowMap : ∀ {A : Set} {{ShowA : Show.Show A}} → Show.Show (BitMap A)
  ShowMap {{ShowA}} = record { to-string = BitMap.show Show.to-string }
