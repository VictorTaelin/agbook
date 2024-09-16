module Data.Float.from-bits where

open import Data.Bits.Type
open import Data.Float.Type
open import Data.Float.from-u64
open import Data.Maybe.Type
open import Data.U64.Type
import Data.U64.from-bits as U64

-- Converts a bit representation to a Float
-- - b: The bit representation to convert.
-- = The Float representation of b, or nothing if conversion fails.
from-bits : Bits → Maybe Float
from-bits b = helper (U64.from-bits b)
    where
        helper          : Maybe U64 → Maybe Float
        helper (Some x) =  Some (from-u64 x)
        helper None     = None
