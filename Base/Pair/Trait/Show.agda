module Base.Pair.Trait.Show where

open import Base.Pair.Pair
import Base.Pair.show as Pair
import Base.Trait.Show as Show

instance
  ShowPair : ∀ {A B : Set} → {{ShowA : Show.Show A}} → {{ShowB : Show.Show B}} → Show.Show (Pair A B)
  ShowPair {{ShowA}} {{ShowB}} = record { to-string = Pair.show {{ShowA}} {{ShowB}} }
