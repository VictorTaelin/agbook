module HVM.Fun.fresh where

open import Data.Bits.Type
open import Data.Bits.inc
open import Data.Pair.Type
open import HVM.Env.Type
open import HVM.Fun.Type

-- Generates a fresh variable by incrementing the current fresh counter in the Env.
-- = A pair containing the updated Env and the fresh Bits.
fresh : Fun Bits
fresh (New var sub) = (New (inc var) sub , var)
