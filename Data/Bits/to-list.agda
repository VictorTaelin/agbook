module Data.Bits.to-list where

open import Data.Nat.Type
open import Data.List.Type
open import Data.Pair.Type
open import Data.Bits.Type
open import Data.Bits.collect-with-depth

-- Collects Bits into a list of Bits, each with depth `d`.
{-# TERMINATING #-}
to-list : Nat → Bits → List Bits
to-list 0 _ = []
to-list d E = []
to-list d bits with collect-with-depth d bits
... | (collected , E) = collected :: []
... | (collected , rest) = collected :: (to-list d rest)
