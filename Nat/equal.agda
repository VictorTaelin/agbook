module Nat.equal where

open import Nat.Main
open import Bool.Main

-- Checks if two natural numbers are equal
-- - m: the first natural number
-- - n: the second natural number
-- = true if m and n are equal, false otherwise
equal : Nat → Nat → Bool
equal zero zero = true
equal zero (succ _) = false
equal (succ _) zero = false
equal (succ m) (succ n) = equal m n
