module Base.F64.eq where

open import Base.Bool.Type
open import Base.F64.Type

primitive primFloatEquality : F64 -> F64 -> Bool

eq : F64 -> F64 -> Bool
eq = primFloatEquality

infix 4 _==_
_==_ : F64 -> F64 -> Bool
_==_ = eq
