module Base.F64.show where

open import Base.F64.Type
open import Base.String.Type

primitive primShowFloat : F64 -> String

show : F64 -> String
show = primShowFloat
