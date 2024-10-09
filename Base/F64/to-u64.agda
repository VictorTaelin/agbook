module Base.F64.to-u64 where

open import Base.F64.F64
open import Base.Maybe.Maybe
open import Base.U64.U64

primitive primFloatToWord64 : F64 → Maybe U64

-- Converts a float to its U64 representation.
-- - x: The float to convert
-- = The U64 representation of x, or nothing if conversion fails.
to-u64 : F64 → Maybe U64
to-u64 = primFloatToWord64

