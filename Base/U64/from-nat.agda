module Base.U64.from-nat where

open import Base.U64.Type
open import Base.Nat.Type

-- Converts a natural number to a U64 number.
-- - n: The natural number to convert.
-- = The U64 representation of the input natural number.
from-nat : Nat → U64
from-nat = primWord64FromNat