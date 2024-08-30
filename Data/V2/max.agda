module Data.V2.max where

open import Data.V2.Main
open import Data.Bool.if
open import Data.Float.Main
open import Data.Float.Comparison

-- Returns the maximum of the x and y coordinates of a V2 vector.
-- - v: The V2 vector.
-- = The maximum value between x and y coordinates.
max_v2 : V2 → Float
max_v2 (MkV2 x y) = if primFloatIsNaN x then y
                    else if primFloatIsNaN y then x
                    else if x f< y then y
                    else x
