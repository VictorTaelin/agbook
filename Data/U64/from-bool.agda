module Data.U64.from-bool where

open import Data.Bool.Type
open import Data.U64.Type 

-- Converts a Bool to a U64 number.
-- - b: The input Bool value.
-- = The corresponding U64 value (1 for True, 0 for False).
from-bool : Bool → U64
from-bool True  = primWord64FromNat 1
from-bool False = primWord64FromNat 0