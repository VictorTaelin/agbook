module Data.U64.eq where

open import Data.U64.Type
open import Data.Nat.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Equal.Type
open import Data.Nat.eq
open import Data.Trait.Eq public

-- Equality comparison of two U64 numbers.
-- - x: The first U64 number.
-- - y: The second U64 number.
-- = A Bool indicating whether x and y are equal.

instance
  EqU64 : Eq U64
  EqU64 = record
    { eq = λ x y →  primWord64ToNat x == primWord64ToNat y
    ; neq = λ x y → not (primWord64ToNat x == primWord64ToNat y)
    }
