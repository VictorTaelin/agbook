module Base.JSON.Trait.Show where

open import Base.JSON.JSON
import Base.JSON.show as JSON
import Base.Trait.Show as Show

instance
  ShowJSON : Show.Show JSON
  ShowJSON = record { to-string = JSON.show }

