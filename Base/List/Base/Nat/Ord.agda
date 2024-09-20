module Base.Nat.Ord where

open import Base.Nat.Type
open import Base.Bool.Type
open import Base.Trait.Ord

-- Implementation of Ord trait for Nat
OrdNat : Ord Nat
OrdNat = record
  { _<_  = λ x y → x < y
  ; _<=_ = λ x y → x <= y
  ; _>_  = λ x y → x > y
  ; _>=_ = λ x y → x >= y
  }

-- Less than
_<_ : Nat → Nat → Bool
Zero   < Zero   = False
Zero   < Succ _ = True
Succ _ < Zero   = False
Succ x < Succ y = x < y

-- Less than or equal
_<=_ : Nat → Nat → Bool
Zero   <= _      = True
Succ _ <= Zero   = False
Succ x <= Succ y = x <= y

-- Greater than
_>_ : Nat → Nat → Bool
x > y = y < x

-- Greater than or equal
_>=_ : Nat → Nat → Bool
x >= y = y <= x

{-# BUILTIN NATLESS _<_ #-}