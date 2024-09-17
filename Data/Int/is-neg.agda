module Data.Int.is-neg where

open import Data.Int.Type
open import Data.Bool.Type

-- checks if a number is negative
-- - n: The Integer to check
-- = True if n is negative, False otherwise

is-pos : Int → Bool
is-pos (Neg n) = True
is-pos (Pos n) = False
