module HVM.Runtime.fresh where

open import HVM.Runtime.Type
open import HVM.State.Type
open import Data.Bits.Type
open import Data.Bits.inc
open import Data.Pair.Type

-- Generates a fresh variable by incrementing the current vars counter in the State.
-- Returns a pair containing the fresh Bits and updates the State.
fresh : Runtime Bits
fresh = λ state →
  let new-vars  = inc (State.vars state)
      new-state = record state { vars = new-vars }
  in new-state , State.vars state
