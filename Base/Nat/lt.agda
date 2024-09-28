module Base.Nat.lt where

open import Base.Nat.Nat
open import Base.Bool.Bool

lt : Nat -> Nat -> Bool
lt _        Zero     = False
lt Zero     (Succ _) = True
lt (Succ x) (Succ y) = lt x y
{-# BUILTIN NATLESS lt #-}

infix 4 _<_
_<_ : Nat -> Nat -> Bool
_<_ = lt
