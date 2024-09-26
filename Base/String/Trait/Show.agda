module Base.String.Trait.Show where

open import Base.String.String
import Base.String.show as String
import Base.Trait.Show as Show

instance
  ShowString : Show.Show String
  ShowString = record { to-string = String.show }
