module Base.Int.lte where

open import Base.Int.Type
open import Base.Ordering.Type
open import Base.Int.compare
open import Base.Bool.Type

-- Less-than-or-equal-to comparison for integers.
-- - x: The 1st integer.
-- - y: The 2nd integer.
-- = True if x is less than or equal to y, False otherwise.
lte : Int -> Int -> Bool
lte a b with compare a b
... | LT = True
... | EQ = True
... | GT = False
