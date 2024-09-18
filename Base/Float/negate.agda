module Base.Float.negate where

open import Base.Float.Type

-- Negates a float 
-- - x: The float to negate
-- = The negated value of x
negate : Float → Float
negate = primFloatNegate
