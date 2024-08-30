module V2.get_x where

open import V2.Main
open import Float.Main

-- Gets the x-coordinate of a V2 vector
-- - v: the V2 vector
-- = the x-coordinate of the vector
get_x : V2 → Float
get_x (MkV2 x _) = x
