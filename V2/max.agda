module V2.max where

open import V2.Main
open import Bool.if_then_else
open import Float.Main
open import Float.Comparison

-- Returns the maximum of the x and y coordinates of a V2 vector
-- - v: the V2 vector
-- = the maximum value between x and y coordinates
max_v2 : V2 → Float
max_v2 (MkV2 x y) = if primFloatIsNaN x then y
                    else if primFloatIsNaN y then x
                    else if x f< y then y
                    else x
