module Base.Char.Trait.Show where

open import Base.Char.Type
import Base.Char.show as Char
open import Base.Trait.Show

instance
  ShowChar : Show Char
  ShowChar = record { to-string = Char.show }
