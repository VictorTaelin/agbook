module Nat.eq where

open import Nat.Main
open import Bool.Main

-- Checks if two nats are equal.
-- - m: the 1st nat.
-- - n: the 2nd nat.
-- = True if m and n are equal.
_==_ : Nat → Nat → Bool
zero   == zero   = true
succ m == succ n = m == n
_      == _      = false

{-# BUILTIN NATEQUALS _==_ #-}
