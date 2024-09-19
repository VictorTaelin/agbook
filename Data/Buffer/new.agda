module Data.Buffer.new where

open import Data.Buffer.Type
open import Data.OrdMap.Type
open import Data.OrdMap.insert
open import Data.OrdMap.empty
open import Data.Pair.Type
open import Data.Nat.Type
open import Data.U64.Type

new : U64 → Buffer
new length = MkBuffer length (fill 0 (primWord64ToNat length) empty)
  where
  fill : U64 → Nat → (OrdMap U64 U64) → (OrdMap U64 U64)
  fill _     Zero map = map
  fill v (Succ n) map = fill v n (insert (primWord64FromNat n , v) map)
