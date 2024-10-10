module Base.F64.eq where

open import Base.Bool.Bool
open import Base.F64.F64

primitive primFloatEquality : F64 → F64 → Bool

eq : F64 → F64 → Bool
eq = primFloatEquality

infix 4 _==_
_==_ : F64 → F64 → Bool
_==_ = eq

