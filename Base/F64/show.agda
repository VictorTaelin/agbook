module Base.F64.show where

open import Base.F64.F64
open import Base.String.String

primitive primShowFloat : F64 -> String

show : F64 -> String
show = primShowFloat
