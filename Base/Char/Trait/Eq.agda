module Base.Char.Trait.Eq where

open import Base.Char.Char
import Base.Char.eq as Char
import Base.Char.neq as Char
import Base.Trait.Eq as Eq

instance
  EqChar : Eq.Eq Char
  EqChar = Eq.make-eq Char.eq Char.neq
