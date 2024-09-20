module Base.Float.neq where

open import Base.Float.Type
open import Base.Bool.Type
open import Base.Bool.not
import Base.Float.eq as Float

neq : Float → Float → Bool
neq x y = not (Float.eq x y)

infix 4 _!=_
_!=_ : Float → Float → Bool
_!=_ = neq
