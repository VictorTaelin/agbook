module Base.Buffer.new where

open import Base.Buffer.Type
open import Base.OrdMap.Type
open import Base.OrdMap.insert
open import Base.OrdMap.empty
open import Base.Pair.Type
open import Base.Nat.Type
open import Base.Nat.to-u64
open import Base.U64.Type
open import Base.U64.Trait.Ord
open import Base.U64.to-nat

-- Creates a new Buffer with size `length` filled with zeros.
new : U64 -> Buffer
new length = MkBuffer length (fill (to-u64 0) (to-nat length) empty)
  where
  fill : U64 -> Nat -> (OrdMap U64 U64) -> (OrdMap U64 U64)
  fill _     Zero map = map
  fill v (Succ n) map = fill v n (insert (to-u64 n , v) map)
