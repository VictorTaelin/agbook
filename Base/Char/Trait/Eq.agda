module Base.Char.Trait.Eq where

open import Base.Char.Char
import Base.Char.eq as Char
import Base.Char.neq as Char
open import Base.Trait.Eq

instance
  EqChar : Eq Char
  EqChar = MkEq Char.eq Char.neq

