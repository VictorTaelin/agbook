module V2.min where

open import V2.Main
open import Bool.if_then_else
open import Float.Comparison
open import Float.Main

-- Returns the minimum of the x and y coordinates of a V2 vector
-- - v: the V2 vector
-- = the minimum value between x and y coordinates
min_v2 : V2 → Float
min_v2 (MkV2 x y) = if primFloatIsNaN x then y
                    else if primFloatIsNaN y then x
                    else if x f< y then x
                    else y
