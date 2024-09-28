module Base.Int.Trait.Show where

import Base.Int.show as Int
open import Base.Int.Int
open import Base.Trait.Show

instance
  ShowInt : Show Int
  ShowInt = MkShow Int.show
