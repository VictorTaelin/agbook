module Base.Nat.lt where

open import Base.Bool.Bool
open import Base.Nat.Nat

-- Checks if one natural number is less than another.
-- - 1st: The natural number.
-- - 2nd: The natural number.
-- = True if 1st is less than 2nd, False otherwise.
lt : Nat → Nat → Bool
lt _        Zero     = False
lt Zero     (Succ _) = True
lt (Succ m) (Succ n) = lt m n

{-# BUILTIN NATLESS lt #-}

-- Infix operator for less-than comparison of natural numbers.
_<_ : Nat → Nat → Bool
_<_ = lt

infix 4 _<_

