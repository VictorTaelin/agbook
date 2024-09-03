module Data.Bits.collect-with-depth where

open import Data.Nat.Type
open import Data.Pair.Type
open import Data.Bits.Type
open import Data.Bits.with-depth

-- Collects the first `m` bits of `bits` into the `fst` and the rest into the `snd`.
collect-with-depth : Nat → Bits → Pair Bits Bits
-- nothing to collect
collect-with-depth Zero bits = (E , bits)
-- we want to collect `m` bits, but `bits` is empty, so we'll pad it with 0s
collect-with-depth (Succ n) E = (with-depth n E , E)
-- collect a 0
collect-with-depth (Succ n) (O bits) with collect-with-depth n bits
... | (collected , rest) = (O collected , rest)
-- collect a 1
collect-with-depth (Succ n) (I bits) with collect-with-depth n bits
... | (collected , rest) = (I collected , rest)
