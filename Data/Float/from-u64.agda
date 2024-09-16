module Data.Float.from-u64 where

open import Data.Float.Type
open import Data.U64.Type

-- Converts a U64 to a Float
-- - x: The U64 to convert.
-- = The Float representation of x.
from-u64 : U64 → Float
from-u64 x = primNatToFloat (primWord64ToNat x)
