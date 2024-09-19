module Base.Nat.div where

open import Base.Nat.Type
open import Base.Nat.sub
open import Base.Nat.lt
open import Base.Bool.if

-- Helper function  div-helper  for Euclidean division.
---------------------------------------------------------------------------
--
-- div-helper computes n / 1+m via iteration on n.
--
--   n div (suc m) = div-helper 0 m n m
--
-- The state of the iterator has two accumulator variables:
--
--   k: The quotient, returned once n=0.  Initialized to 0.
--
--   j: A counter, initialized to the divisor m, decreased on each iteration step.
--      Once it reaches 0, the quotient k is increased and j reset to m,
--      starting the next countdown.
--
-- Under the precondition j ≤ m, the invariant is
--
--   div-helper k m n j = k + (n + m - j) div (1 + m)
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
