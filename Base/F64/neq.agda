module Base.F64.neq where

open import Base.F64.F64
open import Base.Bool.Bool
open import Base.Bool.not
import Base.F64.eq as F64

neq : F64 → F64 → Bool
neq x y = not (F64.eq x y)

infix 4 _!=_
_!=_ : F64 → F64 → Bool
_!=_ = neq

