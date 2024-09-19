module Data.Int.gte where

open import Data.Int.Type
open import Data.Ordering.Type
open import Data.Int.compare
open import Data.Bool.Type

-- Greater-than-or-equal-to comparison for integers.
-- - x: The 1st integer.
-- - y: The 2nd integer.
-- = True if x is greater than or equal to y, False otherwise.
gte : Int → Int → Bool
gte a b with compare a b
... | LT = False
... | EQ = True
... | GT = True
