module Base.Nat.eq where

open import Base.Bool.Bool
open import Base.Nat.Nat

-- Checks if two natural numbers are equal.
-- - 1st: The natural number.
-- - 2nd: The natural number.
-- = True if the numbers are equal, False otherwise.
eq : Nat → Nat → Bool
eq Zero     Zero     = True
eq (Succ m) (Succ n) = eq m n
eq _        _        = False

{-# BUILTIN NATEQUALS eq #-}

-- Infix operator for equality comparison of natural numbers.
_==_ : Nat → Nat → Bool
_==_ = eq

infix 4 _==_

