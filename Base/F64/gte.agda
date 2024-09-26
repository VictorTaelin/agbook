module Base.F64.gte where

open import Base.Bool.Bool
open import Base.Bool.not
open import Base.F64.F64
open import Base.F64.lt

gte : F64 -> F64 -> Bool
gte x y = not (lt x y)

infix 4 _>=_
_>=_ : F64 -> F64 -> Bool
_>=_ = gte
