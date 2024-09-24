module Base.F64.from-nat where

open import Base.F64.Type
open import Base.Nat.Type

primitive primNatToFloat : Nat -> F64

-- Converts a natural number to a float.
-- - n: The natural number to convert.
-- = The float representation of the number.
from-nat : Nat -> F64
from-nat = primNatToFloat
