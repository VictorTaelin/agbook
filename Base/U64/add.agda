module Base.U64.add where

import Base.Nat.add as Nat
open import Base.U64.Type
open import Base.U64.from-nat
open import Base.U64.to-nat

-- Addition of two U64 numbers.
-- - a: The 1st U64 number.
-- - b: The 2nd U64 number.
-- = The sum of a and b as a U64 number.
add : U64 → U64 → U64
add a b = from-nat (Nat.add (to-nat a) (to-nat b))

-- Infix operator for U64 addition.
-- - Equivalent to the 'add' function.
_+_ : U64 → U64 → U64
_+_ = add

infixl 6 _+_
