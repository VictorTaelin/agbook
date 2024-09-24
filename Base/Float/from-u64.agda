module Base.Float.from-u64 where

open import Base.Float.Type
open import Base.U64.Type
open import Base.U64.to-nat
open import Base.Float.from-nat

-- Converts a U64 to a Float
-- - x: The U64 to convert.
-- = The Float representation of x.
from-u64 : U64 -> Float
from-u64 x = from-nat (to-nat x)
