module Data.U64.eq where

open import Data.U64.Type
open import Data.Nat.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Equal.Type
open import Data.Class.Eq
open import Data.Nat.eq


instance
  EqU64 : Eq U64
  EqU64 = record
    { _≡_ = λ x y →  primWord64ToNat x == primWord64ToNat y
    ; _≠_ = λ x y → not (primWord64ToNat x == primWord64ToNat y)
    }

-- Testes
_ : (64 == 64) === True
_ = refl

_ : (64 == 65) === False
_ = refl