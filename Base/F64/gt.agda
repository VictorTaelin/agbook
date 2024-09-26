module Base.F64.gt where

open import Base.Bool.Bool
open import Base.F64.F64
open import Base.F64.lt

gt : F64 -> F64 -> Bool
gt x y = lt y x

infix 4 _>_
_>_ : F64 -> F64 -> Bool
_>_ = gt
