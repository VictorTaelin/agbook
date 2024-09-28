module Base.Nat.gt where

open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.Nat.lt

gt : Nat → Nat → Bool
gt m n = n < m

_>_ : Nat → Nat → Bool
_>_ = gt

infix 4 _>_
