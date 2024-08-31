module Data.Nat.mod where

open import Data.Nat.Main
open import Data.Nat.sub

-- Helper function for modulo operation
-- - k: Accumulator for the remainder
-- - m: The divisor
-- - n: The remaining dividend
-- - j: Counter for the divisor
-- = The remainder of the division
mod-aux : Nat → Nat → Nat → Nat → Nat
mod-aux k m  zero    j        = k
mod-aux k m (succ n) zero     = mod-aux zero m n m
mod-aux k m (succ n) (succ j) = mod-aux (succ k) m n j

{-# BUILTIN NATMODSUCAUX mod-aux #-}

-- Performs natural number modulo operation
-- - n: The dividend
-- - m: The divisor
-- = The remainder of n divided by m
mod : Nat → Nat → Nat
mod n zero     = zero  -- Modulo by zero returns zero
mod n (succ m) = mod-aux zero m n m
