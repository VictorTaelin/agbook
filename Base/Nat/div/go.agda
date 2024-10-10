module Base.Nat.div.go where

open import Base.Bool.if
open import Base.Nat.Nat

-- FIXME: in the Kind version, 'k' is the last argument, for better linearity.
-- Can we change the Agda version too? (The compiler complains here.)

-- Helper function  go  for Euclidean division.
---------------------------------------------------------------------------
--
-- go computes n / 1+m via iteration on n.
--
--   n div (suc m) = go 0 m n m
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
--   go k m n j = (k + (n + m - j)) / (1 + m)
go : Nat → Nat → Nat → Nat → Nat
go k m Zero     j        = k
go k m (Succ n) Zero     = go (Succ k) m n m
go k m (Succ n) (Succ j) = go k m n j
{-# BUILTIN NATDIVSUCAUX go #-}

