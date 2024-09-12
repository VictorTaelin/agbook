module Data.Float.to-bits where

open import Data.Float.Type
open import Data.U64.Type
open import Data.Maybe.Type
open import Data.Float.to-u64
open import Data.Bits.Type
import Data.U64.to-bits as U64

-- Converts a float to its bit representation as Bits.
-- - x: The float to convert.
-- = The Bits representation of x, or an empty bit sequence if conversion fails.
to-bits : Float → Bits
to-bits x = helper (to-u64 x)
    where
        helper : Maybe U64 → Bits
        helper (Some x) = U64.to-bits x
        helper None     = E 
