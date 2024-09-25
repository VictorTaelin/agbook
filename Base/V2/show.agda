module Base.V2.show where

import Base.F64.show as F64
open import Base.String.Type
open import Base.String.append
open import Base.V2.Type

-- Converts a V2 vector to its string representation.
-- - 1st: The V2 vector to be converted.
-- = A string representation of the V2 vector in the format "(x, y)".
show : V2 -> String
show v = "(" ++ F64.show (V2.x v) ++ ", " ++ F64.show (V2.y v) ++ ")"