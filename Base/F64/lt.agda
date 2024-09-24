module Base.F64.lt where

open import Base.F64.Type
open import Base.Bool.Type

primitive primFloatLess : F64 -> F64 -> Bool

lt : F64 -> F64 -> Bool
lt = primFloatLess

infix 4 _<_
_<_ : F64 -> F64 -> Bool
_<_ = lt
