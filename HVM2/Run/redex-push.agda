module HVM2.Run.redex-push where

open import Data.Unit.Type
open import Data.List.Type
open import HVM2.Run.Type
open import HVM2.Run.state-mut
open import HVM2.Run.State.Type
open import HVM2.Term.Type
open import HVM2.Redex.Type
open import HVM2.Net.Type

-- Pushes a new redex to the redex bag
redex-push : Term → Term → Run Unit
redex-push a b = state-mut (λ state → do
  let new-rbag = MkRedex a b :: Net.rbag (State.gnet state)
  let new-gnet = record (State.gnet state) { rbag = new-rbag }
  record state { gnet = new-gnet })
