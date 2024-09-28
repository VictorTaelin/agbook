module Base.Nat.lte where

open import Base.Bool.Bool
open import Base.Bool.or
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Nat.lt

-- FIXME: maybe use COMPILE pragmas for lte.
lte : Nat → Nat → Bool
lte m n = (m < n) || (m == n)

_<=_ : Nat → Nat → Bool
_<=_ = lte

infix 4 _<=_
