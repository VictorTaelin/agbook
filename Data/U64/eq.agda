module Data.U64.eq where

open import Data.U64.Type
open import Data.Nat.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Equal.Type
open import Data.Nat.eq
open import Data.Trait.Eq public

instance
  EqU64 : Eq U64
  EqU64 = record
    { eq = λ x y →  primWord64ToNat x == primWord64ToNat y
    ; neq = λ x y → not (primWord64ToNat x == primWord64ToNat y)
    }