module Nat.less where

open import Nat.Main
open import Bool.Main

-- Checks if one natural number is less than another
-- - n: the first natural number
-- - m: the second natural number
-- = true if n is less than m, false otherwise
_<_ : Nat → Nat → Bool
_     < zero  = false
zero  < succ _ = true
succ n < succ m = n < m

{-# BUILTIN NATLESS _<_ #-}
