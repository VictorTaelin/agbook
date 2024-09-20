module Base.Float.Trait.Show where

open import Base.Float.Type
import Base.Float.show as Float
open import Base.Trait.Show

instance
  ShowFloat : Show Float
  ShowFloat = record { to-string = Float.show }
