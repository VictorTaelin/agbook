module Data.Nat.div where

open import Data.Nat.Main
open import Data.Nat.sub

-- Helper function for division
-- - k: Accumulator for the quotient
-- - m: The divisor
-- - n: The remaining dividend
-- - j: Counter for the divisor
-- = The quotient of the division
div-aux : Nat → Nat → Nat → Nat → Nat
div-aux k m  zero     j       = k
div-aux k m (succ n)  zero    = div-aux (succ k) m n m
div-aux k m (succ n) (succ j) = div-aux k m n j

{-# BUILTIN NATDIVSUCAUX div-aux #-}

-- Performs natural number division
-- - n: The dividend
-- - m: The divisor
-- = The quotient of n divided by m
div : Nat → Nat → Nat
div n zero     = zero  -- Division by zero returns zero
div n (succ m) = div-aux zero m n m
