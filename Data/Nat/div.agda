module Data.Nat.div where

open import Data.Nat.Type
open import Data.Nat.sub
open import Data.Nat.lt
open import Data.Bool.if

div-helper : Nat → Nat → Nat → Nat → Nat
div-helper k m  Zero    j      = k
div-helper k m (Succ n)  Zero   = div-helper (Succ k) m n m
div-helper k m (Succ n) (Succ j) = div-helper k m n j
{-# BUILTIN NATDIVSUCAUX div-helper #-}

-- Integer division of nats.
-- - m: The dividend.
-- - n: The divisor (must be non-zero).
-- = The quotient of m divided by n.
div : Nat → Nat → Nat
div m 0 = 0  -- Division by zero returns zero.
div m (Succ n) = div-helper 0 n m n
