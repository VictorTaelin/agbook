module Data.Float.gt where

open import Data.Float.Type
open import Data.Bool.Type

-- Greater-than comparison for floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = True if x is greater than y.
gt : Float → Float → Bool
gt x y = primFloatLess y x

-- infix version of gt
infix 4 _>_
_>_ : Float → Float → Bool
_>_ = gt 