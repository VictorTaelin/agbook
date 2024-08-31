module Data.Nat.add where

open import Data.Nat.Type

-- Addition of nats.
-- - m: The 1st nat.
-- - n: The 2nd nat.
-- = The sum of m and n.
_+_ : Nat → Nat → Nat
zero     + n = n
(succ m) + n = succ (m + n)

{-# BUILTIN NATPLUS _+_ #-}
