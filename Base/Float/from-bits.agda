module Base.Float.from-bits where

open import Base.Bits.Type
open import Base.Float.Type
open import Base.Float.from-u64
open import Base.Maybe.Type
open import Base.U64.Type
import Base.U64.from-bits as U64

-- Converts a bit representation to a Float
-- - b: The bit representation to convert.
-- = The Float representation of b, or nothing if conversion fails.
from-bits : Bits → Maybe Float
from-bits b = helper (U64.from-bits b)
    where
        helper          : Maybe U64 → Maybe Float
        helper (Some x) = Some (from-u64 x)
        helper None     = None
