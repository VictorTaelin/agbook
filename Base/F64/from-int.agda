module Base.F64.from-int where

open import Base.F64.F64
open import Base.Int.Int

primitive primIntToFloat : Int → F64

-- Converts a Int to a F64
-- - x: The Int to convert.
-- = The F64 representation of x.
from-int : Int → F64
from-int = primIntToFloat
