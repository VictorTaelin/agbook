module Data.Nat.xor where

open import Data.Nat.Type
open import Data.Nat.to-bits
open import Data.Bits.xor using () renaming (_^_ to _^'_)
open import Data.Bits.to-nat

xor : Nat → Nat → Nat
xor a b = to-nat ((to-bits a) ^' (to-bits b))

_^_ : Nat → Nat → Nat
_^_ = xor

infixr 5 _^_
