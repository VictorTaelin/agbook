module Data.Nat.is-zero where

open import Data.Nat.Type
open import Data.Bool.Type

-- Checks if a natural number is zero.
-- - n: The natural number to check.
-- = True if n is zero, False otherwise.
is-zero : Nat → Bool
is-zero Zero     = True
is-zero (Succ _) = False
