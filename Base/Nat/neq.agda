module Base.Nat.neq where

open import Base.Nat.Nat
open import Base.Bool.Bool
open import Base.Bool.not
open import Base.Nat.eq

-- FIXME: maybe use COMPILE pragmas for neq.
neq : Nat -> Nat -> Bool
neq m n = ! (m == n)

infix 4 _!=_
_!=_ : Nat -> Nat -> Bool
_!=_ = neq
