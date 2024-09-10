module Data.U64.show where

open import Data.U64.Type
open import Data.String.Type
open import Data.Trait.Show
open import Data.Nat.show

instance
  ShowU64 : Show U64
  ShowU64 = record { toString = λ x → show (primWord64ToNat x) }

-- Tests
open import Data.Equal.Type

_ : show 42 === "42"
_ = refl