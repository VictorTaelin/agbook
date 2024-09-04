module HVM.Runtime.pop-redex where

open import Data.Function.case
open import Data.List.Type
open import Data.Maybe.Type
open import Data.Pair.Type
open import HVM.Net.Type
open import HVM.Redex.Type
open import HVM.Runtime.Type
open import HVM.State.Type

-- Pops the first redex from the redex bag
pop-redex : Runtime (Maybe Redex)
pop-redex = λ state →
  case Net.rbag (State.gnet state) of λ where
    []        → state , None
    (r :: rs) →  do
      let new-net = record (State.gnet state) { rbag = rs }
      let new-state = record state { gnet = new-net }
      new-state , Some r
