module HVM1.Run.fresh where

open import HVM1.Run.Run
open import HVM1.Run.State.State
open import Base.Bits.Bits
open import Base.Bits.inc
open import Base.Pair.Pair

fresh : Run Bits
fresh = λ state -> do
  let new-ids   = inc (State.ids state)
  let new-state = record state { ids = new-ids }
  new-state , State.ids state
