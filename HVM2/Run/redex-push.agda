module HVM2.Run.redex-push where

open import Base.Unit.Unit
open import Base.List.List
open import HVM2.Run.Run
open import HVM2.Run.state-mut
open import HVM2.Run.State.State
open import HVM2.Term.Term
open import HVM2.Redex.Redex
open import HVM2.Net.Net

-- Pushes a new redex to the redex bag
redex-push : Term → Term → Run Unit
redex-push a b = state-mut (λ state → do
  let new-rbag = MkRedex a b :: Net.rbag (State.gnet state)
  let new-gnet = record (State.gnet state) { rbag = new-rbag }
  record state { gnet = new-gnet })
