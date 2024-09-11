module Data.Float.show where

open import Data.Float.Type
open import Data.String.Type

-- Converts a float to its string representation
-- - x: The float to convert
-- = The string representation of x
show : Float → String
show = primShowFloat
