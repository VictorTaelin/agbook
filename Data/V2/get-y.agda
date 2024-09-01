module Data.V2.get-y where

open import Data.V2.Type
open import Data.Float.Type

-- Gets the y-coordinate of a V2 vector.
-- - v: The V2 vector.
-- = The y-coordinate of the vector.
get-y : V2 → Float
get-y (MkV2 _ y) = y
