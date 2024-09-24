module Base.Float.from-u64 where

open import Base.Float.Type
open import Base.U64.Type
open import Base.Nat.Type
open import Base.U64.to-nat

primitive
  primNatToFloat : Nat -> Float

-- Converts a U64 to a Float
-- - x: The U64 to convert.
-- = The Float representation of x.
from-u64 : U64 -> Float
from-u64 x = primNatToFloat (to-nat x)
