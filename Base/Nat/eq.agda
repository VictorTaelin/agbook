module Base.Nat.eq where

open import Base.Bool.Bool
open import Base.Nat.Nat

-- Checks if two nats are equal.
-- - m: The 1st nat.
-- - n: The 2nd nat.
-- = True if m and n are equal, False otherwise.
eq : Nat → Nat → Bool
eq Zero     Zero     = True
eq (Succ m) (Succ n) = eq m n
eq _        _        = False
{-# BUILTIN NATEQUALS eq #-}

_==_ : Nat → Nat → Bool
{-# BUILTIN NATEQUALS eq #-}
infix 4 _==_
_==_ : Nat -> Nat -> Bool

