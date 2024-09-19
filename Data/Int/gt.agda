module Data.Int.gt where

open import Data.Int.Type
open import Data.Ordering.Type
open import Data.Int.compare
open import Data.Bool.Type

-- Greater-than comparison for integers.
-- - x: The 1st integer.
-- - y: The 2nd integer.
-- = True if x is greater than y, False otherwise.
gt : Int → Int → Bool
gt a b with compare a b
... | LT = False
... | EQ = False
... | GT = True
