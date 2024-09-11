module Data.Float.gte where

open import Data.Float.Type
open import Data.Bool.Type
open import Data.Bool.not

-- Check if the 1st float is greater than or equal to the 2nd float.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = True if x is greater than or equal to y.
gte : Float → Float → Bool
gte x y = not (primFloatLess x y)

-- infix version of gte
infix 4 _>=_
_>=_ : Float → Float → Bool
_>=_ = gte
