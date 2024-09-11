module Data.U64.eq where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.eq

eqU64 : U64 → U64 → Bool
eqU64 x y = eq (primWord64ToNat x) (primWord64ToNat y)
