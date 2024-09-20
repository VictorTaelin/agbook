module Base.String.neq where

open import Base.String.Type
open import Base.Bool.Type
open import Base.Bool.not
import Base.String.eq as String

neq : String → String → Bool
neq x y = not (String.eq x y)

infix 4 _!=_
_!=_ : String → String → Bool
_!=_ = neq
