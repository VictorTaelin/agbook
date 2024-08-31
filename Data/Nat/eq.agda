module Data.Nat.eq where

open import Data.Nat.Type
open import Data.Bool.Type

-- Checks if two nats are equal.
-- - m: The 1st nat.
-- - n: The 2nd nat.
-- = True if m and n are equal.
_==_ : Nat → Nat → Bool
Zero   == Zero   = True
Succ m == Succ n = m == n
_      == _      = False

{-# BUILTIN NATEQUALS _==_ #-}
