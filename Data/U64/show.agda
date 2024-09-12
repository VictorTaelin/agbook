module Data.U64.show where

open import Data.U64.Type
open import Data.String.Type
open import Data.Nat.show
open import Data.Trait.Show public

instance
  ShowU64 : Show U64
  ShowU64 = record { to-string = λ x → show (primWord64ToNat x) }