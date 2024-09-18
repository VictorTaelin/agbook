module HVM1.Run.fresh where

open import HVM1.Run.Type
open import HVM1.Run.State.Type
open import Base.Bits.Type
open import Base.Bits.inc
open import Base.Pair.Type

fresh : Run Bits
fresh = λ state → do
  let new-ids   = inc (State.ids state)
  let new-state = record state { ids = new-ids }
  new-state , State.ids state
