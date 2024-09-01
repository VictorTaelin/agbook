module Data.U64.add where

open import Data.Nat.add
open import Data.U64.Type

addU64 : U64 → U64 → U64
addU64 a b = primWord64FromNat (primWord64ToNat a + primWord64ToNat b)
