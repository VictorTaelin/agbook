module Base.Float.to-u64 where

open import Base.Float.Type
open import Base.Maybe.Type
open import Base.U64.Type

-- Converts a float to its U64 representation.
-- - x: The float to convert
-- = The U64 representation of x, or nothing if conversion fails.
to-u64 : Float → Maybe U64
to-u64 = primFloatToWord64
