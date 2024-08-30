module Data.V2.get_y where

open import Data.V2.Main
open import Data.Float.Main

-- Gets the y-coordinate of a V2 vector.
-- - v: The V2 vector.
-- = The y-coordinate of the vector.
get_y : V2 → Float
get_y (MkV2 _ y) = y
