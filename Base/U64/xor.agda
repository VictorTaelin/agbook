module Base.U64.xor where 

open import Base.U64.U64
open import Base.Bits.Bits
open import Base.Bits.xor renaming (xor to xorB; _^_ to _^b_ )
open import Base.Nat.Nat
open import Base.U64.to-bits
open import Base.Bits.to-nat
open import Base.U64.from-nat

-- Bitwise XOR operation on two U64 numbers.
-- - a: The first U64 number.
-- - b: The second U64 number.
-- = The result of bitwise XOR of a and b as a U64 number.
xor : U64 → U64 → U64 
xor a b = from-nat (to-nat ((to-bits a) ^b (to-bits b)))

infixl 6 _^_
-- Infix operator for U64 bitwise XOR.
-- - Equivalent to the 'xor' function.
_^_ : U64 → U64 → U64
_^_ = xor

