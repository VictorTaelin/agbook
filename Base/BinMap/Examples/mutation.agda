module Base.BinMap.Examples.mutation where

open import Base.BinMap.BinMap
open import Base.BinMap.empty
open import Base.BinMap.set
open import Base.Bits.Bits
open import Base.Bits.from-nat
open import Base.Nat.Nat
open import Base.String.String

-- Example of mutation with pure maps
-- Creates a BinMap of Nat to String and adds key-value pairs
-- = A BinMap containing the key-value pairs (1, "one"), (2, "two"), and (3, "three")
mutation : BinMap String
mutation = do
  let map = empty
  let map = set map (from-nat 1) "one"
  let map = set map (from-nat 2) "two"
  set map (from-nat 3) "three"

