module Base.Bits.split-at where

open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.Bits.Bits
open import Base.Bits.pad-zeros

-- Collects the first `m` bits of `bits` into the `fst` and the rest into the `snd`.
split-at : Nat -> Bits -> Pair Bits Bits
split-at Zero bits       = (E , bits)
split-at (Succ n) E      = (pad-zeros n E , E)
split-at (Succ n) (O bits) with split-at n bits
... | (collected , rest) = (O collected , rest)
split-at (Succ n) (I bits) with split-at n bits
... | (collected , rest) = (I collected , rest)
