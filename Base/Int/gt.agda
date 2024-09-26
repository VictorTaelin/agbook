module Base.Int.gt where

open import Base.Int.Int
open import Base.Ordering.Ordering
open import Base.Int.compare
open import Base.Bool.Bool

-- Greater-than comparison for integers.
-- - x: The 1st integer.
-- - y: The 2nd integer.
-- = True if x is greater than y, False otherwise.
gt : Int -> Int -> Bool
gt a b with compare a b
... | LT = False
... | EQ = False
... | GT = True
