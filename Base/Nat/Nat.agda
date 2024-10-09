module Base.Nat.Nat where

-- Represents nats.
-- - Zero: The zero nat.
-- - Succ: The successor of a nat.
data Nat : Set where
  Zero : Nat
  Succ : Nat → Nat
{-# BUILTIN NATURAL Nat #-}

