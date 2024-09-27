module Base.Nat.xor where

open import Base.Nat.Nat
open import Base.Nat.to-bits
import Base.Bits.xor as Bits
open import Base.Bits.to-nat

xor : Nat -> Nat -> Nat
xor a b = to-nat ((to-bits a) Bits.^ (to-bits b))

_^_ : Nat -> Nat -> Nat
_^_ = xor

infixr 5 _^_
