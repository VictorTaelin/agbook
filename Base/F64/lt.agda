module Base.F64.lt where

open import Base.F64.F64
open import Base.Bool.Bool

primitive primFloatLess : F64 → F64 → Bool

lt : F64 → F64 → Bool
lt = primFloatLess

infix 4 _<_
_<_ : F64 → F64 → Bool
_<_ = lt
