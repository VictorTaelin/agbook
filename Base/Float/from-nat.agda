module Base.Float.from-nat where

open import Base.Float.Type
open import Base.Nat.Type

primitive
  primNatToFloat : Nat → Float

-- Converts a natural number to a float.
-- - n: The natural number to convert.
-- = The float representation of the number.
from-nat : Nat -> Float
from-nat = primNatToFloat
