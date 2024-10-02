module Base.Nat.xor where

open import Base.Bits.to-nat
import Base.Bits.xor as Bits
open import Base.Nat.Nat
open import Base.Nat.to-bits

-- Performs bitwise XOR operation on two natural numbers.
-- 1st: The natural number.
-- 2nd: The natural number.
-- = A new natural number representing the bitwise XOR of the inputs.
xor : Nat → Nat → Nat
xor a b = to-nat (to-bits a Bits.^ to-bits b)

-- Infix operator for bitwise XOR on natural numbers.
_^_ : Nat → Nat → Nat
_^_ = xor

infixr 5 _^_