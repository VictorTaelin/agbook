module Base.F64.from-u64 where

open import Base.F64.F64
open import Base.F64.from-nat
open import Base.U64.U64
open import Base.U64.to-nat

-- Converts a U64 to a F64
-- - x: The U64 to convert.
-- = The F64 representation of x.
from-u64 : U64 -> F64
from-u64 x = from-nat (to-nat x)
