module Data.Bits.pad-length where

open import Data.Bits.Type
open import Data.Bits.length
open import Data.Bits.pad-zeros
open import Data.Pair.Type
open import Data.Nat.Type
open import Data.Nat.max
open import Data.Nat.sub

-- Ensures two Bits values have the same length by padding with leading zeros.
-- - a: The 1st Bits value.
-- - b: The 2nd Bits value.
-- = A pair of Bits values with equal length, padded if necessary.
pad-length : Bits → Bits → Pair Bits Bits
pad-length a b = do
  let len-a   = length a
  let len-b   = length b
  let trg-len = max len-a len-b
  pad-zeros trg-len a , pad-zeros trg-len b
