module Data.U64.or where 

open import Data.U64.Type
open import Data.Bits.Type
open import Data.Bits.to-nat
open import Data.Bits.or renaming (or to orB; _||_ to _||b_)
open import Data.Nat.Type
open import Data.U64.to-bits

-- Bitwise OR operation for two U64 numbers.
-- - a: The first U64 number.
-- - b: The second U64 number.
-- = The result of bitwise OR operation on a and b as a U64 number.
or : U64 -> U64 -> U64 
or a b = primWord64FromNat (to-nat ((to-bits a) ||b (to-bits b)))

infixl 5 _||_
-- Infix operator for U64 bitwise OR.
-- - Equivalent to the 'or' function.
_||_ : U64 -> U64 -> U64
_||_ = or