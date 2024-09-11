module Data.Bits.split-chunks where

open import Data.Nat.Type
open import Data.List.Type
open import Data.Pair.Type
open import Data.Bits.Type
open import Data.Bits.split-at

-- Collects Bits into a list of Bits, each with length `d`.
{-# TERMINATING #-}
split-chunks : Nat → Bits → List Bits
split-chunks 0 _ = []
split-chunks d E = []
split-chunks d bits with split-at d bits
... | (collected , E)    = collected :: []
... | (collected , rest) = collected :: (split-chunks d rest)
