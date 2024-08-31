module Data.V2.min where

open import Data.V2.Type
open import Data.Bool.if
open import Data.Float.Comparison
open import Data.Float.Type

-- Returns the minimum of the x and y coordinates of a V2 vector.
-- - v: The V2 vector.
-- = The minimum value between x and y coordinates.
min_v2 : V2 → Float
min_v2 (MkV2 x y) = if primFloatIsNaN x then y
                    else if primFloatIsNaN y then x
                    else if x f< y then x
                    else y
