module Data.Float.to-bits where

open import Data.Float.Type
open import Data.U64.Type
open import Data.Maybe.Type

-- Converts a float to its bit representation as a U64.
-- - x: The float to convert
-- = The U64 representation of x, or nothing if conversion fails.
to-bits : Float → Maybe U64
to-bits x = primFloatToWord64 x
