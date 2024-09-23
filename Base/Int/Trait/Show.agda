module Base.Int.Trait.Show where

import Base.Int.show as Int
open import Base.Int.Type
open import Base.Trait.Show

instance
  Show-Int : Show Int
  Show-Int = make-show Int.show
