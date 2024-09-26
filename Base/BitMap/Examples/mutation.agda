module Base.BitMap.Examples.mutation where

open import Base.BitMap.BitMap
open import Base.BitMap.empty
open import Base.BitMap.set
open import Base.Bits.Bits
open import Base.Bits.from-nat
open import Base.Nat.Nat
open import Base.String.String

-- Example of mutation with pure maps
-- Creates a BitMap of Nat to String and adds key-value pairs
-- = A BitMap containing the key-value pairs (1, "one"), (2, "two"), and (3, "three")
mutation : BitMap String
mutation = do
  let map = empty
  let map = set map (from-nat 1) "one"
  let map = set map (from-nat 2) "two"
  set map (from-nat 3) "three"
