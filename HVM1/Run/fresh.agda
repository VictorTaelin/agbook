module HVM1.Run.fresh where

open import HVM1.Run.Type
open import HVM1.Run.State.Type
open import Data.Bits.Type
open import Data.Bits.inc
open import Data.Pair.Type

-- Generates a fresh variable by incrementing the current ids counter in the State.
-- Returns a pair containing the fresh Bits and updates the State.
fresh : Run Bits
fresh = λ state → do
  let new-ids   = inc (State.ids state)
  let new-state = record state { ids = new-ids }
  new-state , State.ids state
