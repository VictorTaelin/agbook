module Data.Float.lte where

open import Data.Bool.not
open import Data.Bool.Type
open import Data.Float.Type

-- Check if the 1st float is less than or equal to the 2nd float.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = True if x is less than or equal to y.

lte : Float → Float → Bool
lte x y = not (primFloatLess y x)

-- infix version of lte
infix 4 _<=_
_<=_ : Float → Float → Bool
_<=_ = lte
