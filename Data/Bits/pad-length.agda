module Data.Bits.pad-length where

open import Data.Bits.Type
open import Data.Bits.length
open import Data.Bits.pad-zeros
open import Data.Pair.Type
open import Data.Nat.Type
open import Data.Nat.max
open import Data.Nat.sub

-- Ensures two Bits values have the same length by padding with leading zeros.
-- - a: The first Bits value.
-- - b: The second Bits value.
-- = A pair of Bits values with equal length, padded if necessary.
pad-length : Bits → Bits → Pair Bits Bits
pad-length a b =
  let len-a = length a
      len-b = length b
      target-len = max len-a len-b
  in pad-zeros (target-len - len-a) a , pad-zeros (target-len - len-b) b
