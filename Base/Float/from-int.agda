module Base.Float.from-int where

open import Base.Float.Type
open import Base.Int.Type

primitive
  primIntToFloat : Int → Float

-- Converts a Int to a Float
-- - x: The Int to convert.
-- = The Float representation of x.
from-int : Int -> Float
from-int = primIntToFloat
