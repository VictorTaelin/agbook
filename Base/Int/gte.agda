module Base.Int.gte where

open import Base.Int.Type
open import Base.Ordering.Type
open import Base.Int.compare
open import Base.Bool.Type

-- Greater-than-or-equal-to comparison for integers.
-- - x: The 1st integer.
-- - y: The 2nd integer.
-- = True if x is greater than or equal to y, False otherwise.
gte : Int → Int → Bool
gte a b with compare a b
... | LT = False
... | EQ = True
... | GT = True
