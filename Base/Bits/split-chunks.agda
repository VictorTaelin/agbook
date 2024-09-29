module Base.Bits.split-chunks where

open import Base.Nat.Nat
open import Base.List.List
open import Base.Pair.Pair
open import Base.Bits.Bits
open import Base.Bits.split-at

-- Collects Bits into a list of Bits, each with length `d`.
{-# TERMINATING #-} -- FIXME!
split-chunks : Nat → Bits → List Bits
split-chunks 0 _ = []
split-chunks d E = []
split-chunks d bits with split-at d bits
... | (collected , E)    = collected :: []
... | (collected , rest) = collected :: (split-chunks d rest)
