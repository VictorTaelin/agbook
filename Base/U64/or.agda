module Base.U64.or where 

open import Base.U64.U64
open import Base.Bits.Bits
open import Base.Bits.to-nat
open import Base.Bits.or renaming (or to orB; _||_ to _||b_)
open import Base.Nat.Nat
open import Base.U64.to-bits
open import Base.U64.from-nat

-- Bitwise OR operation for two U64 numbers.
-- - a: The first U64 number.
-- - b: The second U64 number.
-- = The result of bitwise OR operation on a and b as a U64 number.
or : U64 → U64 → U64 
or a b = from-nat (to-nat ((to-bits a) ||b (to-bits b)))

infixl 5 _||_
-- Infix operator for U64 bitwise OR.
-- - Equivalent to the 'or' function.
_||_ : U64 → U64 → U64
_||_ = or
