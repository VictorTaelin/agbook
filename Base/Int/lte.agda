module Base.Int.lte where

open import Base.Int.Int
open import Base.Ordering.Ordering
open import Base.Int.compare
open import Base.Bool.Bool

-- Less-than-or-equal-to comparison for integers.
-- - x: The 1st integer.
-- - y: The 2nd integer.
-- = True if x is less than or equal to y, False otherwise.
lte : Int -> Int -> Bool
lte a b with compare a b
... | LT = True
... | EQ = True
... | GT = False
