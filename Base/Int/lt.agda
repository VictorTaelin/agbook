module Base.Int.lt where

open import Base.Int.Type
open import Base.Ordering.Type
open import Base.Int.compare
open import Base.Bool.Type

-- Less-than comparison for integers.
-- - x: The 1st integer.
-- - y: The 2nd integer.
-- = True if x is less than y, False otherwise.
lt : Int -> Int -> Bool
lt a b with compare a b
... | LT = True
... | EQ = False
... | GT = False
