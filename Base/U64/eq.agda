module Base.U64.eq where

open import Base.U64.Type
open import Base.Nat.Type
open import Base.Bool.Type
open import Base.Bool.not
open import Base.Equal.Type
open import Base.Nat.eq
open import Base.Trait.Eq public

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
