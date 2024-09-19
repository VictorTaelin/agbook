module Base.Buffer.new where

open import Base.Buffer.Type
open import Base.OrdMap.Type
open import Base.OrdMap.insert
open import Base.OrdMap.empty
open import Base.Pair.Type
open import Base.Nat.Type
open import Base.U64.Type
open import Base.U64.Ord

-- Creates a new Buffer with size `length` filled with zeros.
new : U64 → Buffer
new length = MkBuffer length (fill (primWord64FromNat 0) (primWord64ToNat length) empty)
  where
  fill : U64 → Nat → (OrdMap U64 U64) → (OrdMap U64 U64)
  fill _     Zero map = map
  fill v (Succ n) map = fill v n (insert {{OrdU64}} (primWord64FromNat n , v) map)
