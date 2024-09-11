module Data.Float.from-bits where

open import Data.Float.Type
open import Data.U64.Type
open import Data.Maybe.Type

-- Converts a U64 to a Float.
-- - x: The U64 to convert.
-- = The Float representation of x.
from-bits : U64 → Maybe Float
from-bits x = Some (primFloatFromWord64 x)
    where
        postulate primFloatFromWord64 : U64 → Float
