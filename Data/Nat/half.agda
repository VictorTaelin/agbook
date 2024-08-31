module Data.Nat.half where

open import Data.Nat.Type

-- Calculates half of a natural number.
-- - n: The number to halve.
-- = The largest natural number not exceeding n/2.
half : Nat → Nat
half zero            = zero
half (succ zero)     = zero
half (succ (succ n)) = succ (half n)
