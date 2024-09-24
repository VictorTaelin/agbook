module Base.F64.to-u64 where

open import Base.F64.Type
open import Base.Maybe.Type
open import Base.U64.Type

primitive primFloatToWord64 : F64 -> Maybe U64

-- Converts a float to its U64 representation.
-- - x: The float to convert
-- = The U64 representation of x, or nothing if conversion fails.
to-u64 : F64 -> Maybe U64
to-u64 = primFloatToWord64
