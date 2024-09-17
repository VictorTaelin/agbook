module Data.U64.double where

open import Data.U64.Type
open import Data.U64.add

-- Doubles a given U64 number
-- Input: x (U64)
-- Output: The result of x + x (U64)
double : U64 → U64
double x = x + x