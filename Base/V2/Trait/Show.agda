module Base.V2.Trait.Show where

import Base.V2.show as V2
open import Base.Trait.Show
open import Base.V2.V2

instance
  ShowV2 : Show V2
  ShowV2 = record { to-string = V2.show }
