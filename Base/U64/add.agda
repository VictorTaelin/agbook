module Base.U64.add where

open import Base.Nat.add renaming (_+_ to _n+_; add to addN)
open import Base.U64.Type
open import Base.U64.to-nat
open import Base.U64.from-nat

-- Addition of two U64 numbers.
-- - a: The first U64 number.
-- - b: The second U64 number.
-- = The sum of a and b as a U64 number.
add : U64 → U64 → U64
add a b = from-nat (to-nat a n+ to-nat b)

infixl 6 _+_
-- Infix operator for U64 addition.
-- - Equivalent to the 'add' function.
_+_ : U64 → U64 → U64
_+_ = add
