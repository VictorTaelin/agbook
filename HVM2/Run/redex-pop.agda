module HVM2.Run.redex-pop where

open import Base.Function.case
open import Base.List.Type
open import Base.Maybe.Type
open import Base.Pair.Type
open import HVM2.Net.Type
open import HVM2.Redex.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type

-- Pops the first redex from the redex bag
redex-pop : Run (Maybe Redex)
redex-pop = λ state ->
  case Net.rbag (State.gnet state) of λ where
    []        -> state , None
    (r :: rs) ->  do
      let new-net = record (State.gnet state) { rbag = rs }
      let new-state = record state { gnet = new-net }
      new-state , Some r
