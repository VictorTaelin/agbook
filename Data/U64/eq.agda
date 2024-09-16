module Data.U64.eq where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.eq renaming (_==_ to _n==_; eq to natEq)

-- Equality comparison of two U64 numbers.
-- - x: The first U64 number.
-- - y: The second U64 number.
-- = A Bool indicating whether x and y are equal.
eq : U64 → U64 → Bool
eq x y = (primWord64ToNat x) n== (primWord64ToNat y)

infix 4 _==_
-- Infix operator for U64 equality comparison.
-- - Equivalent to the 'eq' function.
_==_ : U64 → U64 → Bool
_==_ = eq