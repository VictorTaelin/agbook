module Data.Nat.eq where

open import Data.Nat.Type
open import Data.Bool.Type

-- Checks if two nats are equal.
-- - m: The 1st nat.
-- - n: The 2nd nat.
-- = True if m and n are equal.
eq : Nat → Nat → Bool
eq Zero     Zero     = True
eq (Succ m) (Succ n) = eq m n
eq _        _        = False

_==_ : Nat → Nat → Bool
_==_ = eq

{-# BUILTIN NATEQUALS _==_ #-}
