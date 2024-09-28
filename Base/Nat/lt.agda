module Base.Nat.lt where

open import Base.Bool.Bool
open import Base.Nat.Nat

lt : Nat → Nat → Bool
lt _        Zero     = False
lt Zero     (Succ _) = True
lt (Succ m) (Succ n) = lt m n
{-# BUILTIN NATLESS lt #-}

_<_ : Nat → Nat → Bool
_<_ = lt

infix 4 _<_
