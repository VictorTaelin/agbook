module Base.F64.to-bits where

import Base.U64.to-bits as U64
open import Base.Bits.Bits
open import Base.F64.F64
open import Base.F64.to-u64
open import Base.Maybe.Maybe
open import Base.U64.U64

-- Converts a float to its bit representation as Bits.
-- - x: The float to convert.
-- = The Bits representation of x, or an empty bit sequence if conversion fails.
to-bits : F64 -> Bits
to-bits x = helper (to-u64 x)
    where
        helper : Maybe U64 -> Bits
        helper (Some x) = U64.to-bits x
        helper None     = E 
