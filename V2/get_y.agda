module V2.get_y where

open import V2.Main
open import Float.Main

-- Gets the y-coordinate of a V2 vector
-- - v: the V2 vector
-- = the y-coordinate of the vector
get_y : V2 → Float
get_y (MkV2 _ y) = y