module Base.Buffer.new where

open import Base.Buffer.Buffer
open import Base.OrdMap.OrdMap
open import Base.OrdMap.insert
open import Base.OrdMap.empty
open import Base.Pair.Pair
open import Base.Nat.Nat
open import Base.Nat.to-u64
open import Base.U64.U64
open import Base.U64.Trait.Ord

-- Creates a new Buffer with size `length` filled with zeros.
new : Nat → Buffer
new length = MkBuffer length (fill (to-u64 0) length empty)
  where
  fill : U64 → Nat → (OrdMap U64 U64) → (OrdMap U64 U64)
  fill _     Zero map = map
  fill v (Succ n) map = fill v n (insert (to-u64 n , v) map)
