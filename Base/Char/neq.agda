module Base.Char.neq where

open import Base.Char.Type
open import Base.Bool.Type
open import Base.Bool.not
import Base.Char.eq as Char

neq : Char → Char → Bool
neq x y = not (Char.eq x y)

infix 4 _!=_
_!=_ : Char → Char → Bool
_!=_ = neq
