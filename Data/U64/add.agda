module Data.U64.add where

open import Data.Nat.add renaming (_+_ to _n+_; add to addN)
open import Data.U64.Type

-- Addition of two U64 numbers.
-- - a: The first U64 number.
-- - b: The second U64 number.
-- = The sum of a and b as a U64 number.
add : U64 → U64 → U64
add a b = primWord64FromNat (primWord64ToNat a n+ primWord64ToNat b)

infixl 6 _+_
-- Infix operator for U64 addition.
-- - Equivalent to the 'add' function.
_+_ : U64 → U64 → U64
_+_ = add