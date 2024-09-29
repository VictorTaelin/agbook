module Base.Nat.range where

open import Base.Bool.Bool
open import Base.List.List
open import Base.Nat.Nat
open import Base.Nat.lt

-- Generates a list of natural numbers from start (inclusive) to end (exclusive).
-- - start: The first number in the range.
-- - end: The number after the last number in the range.
-- = A list of natural numbers from start to (end - 1).
{-# TERMINATING #-} -- FIXME!
range : Nat → Nat → List Nat
range start end with start < end
... | False = []
... | True  = start :: range (Succ start) end
