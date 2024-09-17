module Data.U64.xor where 

open import Data.U64.Type
open import Data.Bits.Type
open import Data.Bits.xor renaming (xor to xorB; _^_ to _^b_ )
open import Data.Nat.Type
open import Data.U64.to-bits
open import Data.Bits.to-nat

-- Bitwise XOR operation on two U64 numbers.
-- - a: The first U64 number.
-- - b: The second U64 number.
-- = The result of bitwise XOR of a and b as a U64 number.
xor : U64 -> U64 -> U64 
xor a b = primWord64FromNat (to-nat ((to-bits a) ^b (to-bits b)))

infixl 6 _^_
-- Infix operator for U64 bitwise XOR.
-- - Equivalent to the 'xor' function.
_^_ : U64 -> U64 -> U64
_^_ = xor