module HVM.Fun.fresh where

open import HVM.Fun.Type
open import HVM.Env.Type
open import Data.Bits.Type
open import Data.Bits.inc
open import Data.Pair.Type

-- Generates a fresh variable by incrementing the current fresh counter in the Env.
-- = A pair containing the updated Env and the fresh Bits.
fresh : Fun Bits
fresh (Env var sub) = 
  let new_var = inc var
  in (Env new_var sub , new_var)
