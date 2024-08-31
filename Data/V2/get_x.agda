module Data.V2.get_x where

open import Data.V2.Type
open import Data.Float.Type

-- Gets the x-coordinate of a V2 vector.
-- - v: The V2 vector.
-- = The x-coordinate of the vector.
get_x : V2 → Float
get_x (MkV2 x _) = x
