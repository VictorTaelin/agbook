module Base.Nat.gte where

open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.Nat.lte

gte : Nat → Nat → Bool
gte m n = n <= m

_>=_ : Nat → Nat → Bool
_>=_ = gte

infix 4 _>=_
