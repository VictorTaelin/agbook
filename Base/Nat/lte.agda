module Base.Nat.lte where

open import Base.Nat.Type
open import Base.Bool.Type
open import Base.Bool.or
open import Base.Nat.eq
open import Base.Nat.lt

lte : Nat → Nat → Bool
lte x y = (eq x y) || (lt x y)

infix 4 _<=_
_<=_ : Nat → Nat → Bool
_<=_ = lte
