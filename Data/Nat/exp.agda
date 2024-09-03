module Data.Nat.exp where

open import Data.Nat.Type
open import Data.Nat.add
open import Data.Nat.mul

-- Exponentiation of nats.
-- - m: The 1st nat.
-- - n: The 2nd nat.
-- = m to the power of n.
exp : Nat → Nat → Nat
exp m     Zero = 1
exp m (Succ n) = m * (exp m n)

_^_ : Nat → Nat → Nat
_^_ = exp

infixr 8 _^_
