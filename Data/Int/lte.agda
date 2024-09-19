module Data.Int.lte where

open import Data.Int.Type
open import Data.Ordering.Type
open import Data.Int.compare
open import Data.Bool.Type

-- Less-than-or-equal-to comparison for integers.
-- - x: The 1st integer.
-- - y: The 2nd integer.
-- = True if x is less than or equal to y, False otherwise.
lte : Int → Int → Bool
lte a b with compare a b
... | LT = True
... | EQ = True
... | GT = False
