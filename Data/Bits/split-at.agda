module Data.Bits.split-at where

open import Data.Nat.Type
open import Data.Pair.Type
open import Data.Bits.Type
open import Data.Bits.pad-zeros

-- Collects the first `m` bits of `bits` into the `fst` and the rest into the `snd`.
split-at : Nat → Bits → Pair Bits Bits
-- nothing to collect
split-at Zero bits = (E , bits)
-- we want to collect `m` bits, but `bits` is empty, so we'll pad it with 0s
split-at (Succ n) E = (pad-zeros n E , E)
-- collect a 0
split-at (Succ n) (O bits) with split-at n bits
... | (collected , rest) = (O collected , rest)
-- collect a 1
split-at (Succ n) (I bits) with split-at n bits
... | (collected , rest) = (I collected , rest)
