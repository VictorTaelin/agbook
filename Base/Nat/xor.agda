module Base.Nat.xor where

open import Base.Nat.Type
open import Base.Nat.to-bits
open import Base.Bits.xor using () renaming (_^_ to _^'_)
open import Base.Bits.to-nat

xor : Nat → Nat → Nat
xor a b = to-nat ((to-bits a) ^' (to-bits b))

_^_ : Nat → Nat → Nat
_^_ = xor

infixr 5 _^_
