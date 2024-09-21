module Base.U64.from-bits where

open import Base.U64.Type
open import Base.Bits.Type
open import Base.Nat.Type
open import Base.Maybe.Type
open import Base.Nat.double
open import Base.U64.from-nat

-- Converts a bit representation to a Maybe U64.
-- - x: The bit representation to convert.
-- = The U64 representation of x, or nothing if conversion fails.
from-bits : Bits → Maybe U64
from-bits b = from-bits-go b Zero where
  from-bits-go : Bits → Nat → Maybe U64
  from-bits-go E      acc = Some (from-nat acc)
  from-bits-go (O bs) acc = from-bits-go bs (double acc)
  from-bits-go (I bs) acc = from-bits-go bs (Succ (double acc))

