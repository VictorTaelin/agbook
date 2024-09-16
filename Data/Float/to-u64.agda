module Data.Float.to-u64 where

open import Data.Float.Type
open import Data.Maybe.Type
open import Data.U64.Type

-- Converts a float to its U64 representation.
-- - x: The float to convert
-- = The U64 representation of x, or nothing if conversion fails.
to-u64 : Float → Maybe U64
to-u64 = primFloatToWord64
