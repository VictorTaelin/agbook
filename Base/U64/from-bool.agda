module Base.U64.from-bool where

open import Base.Bool.Bool
open import Base.U64.U64 
open import Base.U64.from-nat

-- Converts a Bool to a U64 number.
-- - b: The input Bool value.
-- = The corresponding U64 value (1 for True, 0 for False).
from-bool : Bool → U64
from-bool True  = from-nat 1
from-bool False = from-nat 0
