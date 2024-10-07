module HVM.Run.redex-pop where

open import Base.Function.case
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import HVM.Net.Net
open import HVM.Redex.Redex
open import HVM.Run.Run
open import HVM.Run.State.State

-- Pops the first redex from the redex bag
redex-pop : Run (Maybe Redex)
redex-pop = λ state →
  case Net.rbag (State.gnet state) of λ where
    []        → state , None
    (r :: rs) → do
      let new-net   = record (State.gnet state) { rbag = rs }
      let new-state = record state { gnet = new-net }
      new-state , Some r
