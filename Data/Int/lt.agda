module Data.Int.lt where

open import Data.Int.Type
open import Data.Ordering.Type
open import Data.Int.compare
open import Data.Bool.Type

-- Less-than comparison for integers.
-- - x: The 1st integer.
-- - y: The 2nd integer.
-- = True if x is less than y, False otherwise.
lt : Int → Int → Bool
lt a b with compare a b
... | LT = True
... | EQ = False
... | GT = False
