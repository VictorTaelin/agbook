module Data.Int.is-pos where

open import Data.Int.Type
open import Data.Bool.Type

-- checks if a number is positive
-- - n: the integer to check
-- = true if n is positive, false otherwise

is-pos : Int → Bool
is-pos (Pos n) = True
is-pos (Neg n) = False
