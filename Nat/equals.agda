module Nat.equals where

open import Nat.Main
open import Bool.Main

-- Checks if two natural numbers are equal
-- - m: the first natural number
-- - n: the second natural number
-- = true if m and n are equal, false otherwise
_==_ : Nat → Nat → Bool
zero  == zero  = true
succ m == succ n = m == n
_     == _     = false

{-# BUILTIN NATEQUALS _==_ #-}
