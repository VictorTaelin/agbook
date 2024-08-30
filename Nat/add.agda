module Nat.add where

open import Nat.Main

-- Addition of nats.
-- - m: the 1st nat.
-- - n: the 2nd nat.
-- = The sum of m and n.
_+_ : Nat → Nat → Nat
zero     + n = n
(succ m) + n = succ (m + n)

{-# BUILTIN NATPLUS _+_ #-}
