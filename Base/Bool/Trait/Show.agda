module Base.Bool.Trait.Show where

open import Base.Bool.Bool
import Base.Bool.show as Bool
open import Base.Trait.Show

instance
  ShowBool : Show Bool
  ShowBool = record { to-string = Bool.show }
