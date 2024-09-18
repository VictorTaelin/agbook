module Base.Float.to-bits where

open import Base.Bits.Type
open import Base.Float.to-u64
open import Base.Float.Type
open import Base.Maybe.Type
import Base.U64.to-bits as U64
open import Base.U64.Type

-- Converts a float to its bit representation as Bits.
-- - x: The float to convert.
-- = The Bits representation of x, or an empty bit sequence if conversion fails.
to-bits : Float → Bits
to-bits x = helper (to-u64 x)
    where
        helper : Maybe U64 → Bits
        helper (Some x) = U64.to-bits x
        helper None     = E 
