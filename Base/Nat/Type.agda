module Base.Nat.Type where

-- A natural number with two constructors:
-- - Zero : Represents the number zero.
-- - Succ : Represents the successor of a natural number.
data Nat : Set where
  Zero : Nat
  Succ : (pred : Nat) → Nat

{-# BUILTIN NATURAL Nat #-}