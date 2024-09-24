module Base.F64.from-bits where

import Base.U64.from-bits as U64
open import Base.Bits.Type
open import Base.F64.Type
open import Base.F64.from-u64
open import Base.Maybe.Type
open import Base.U64.Type

-- Converts a bit representation to a F64
-- - b: The bit representation to convert.
-- = The F64 representation of b, or nothing if conversion fails.
from-bits : Bits -> Maybe F64
from-bits b = helper (U64.from-bits b)
    where
        helper          : Maybe U64 -> Maybe F64
        helper (Some x) = Some (from-u64 x)
        helper None     = None
