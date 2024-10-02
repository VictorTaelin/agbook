module HVM.Run.redex-push where

open import Base.List.List
open import Base.Unit.Unit
open import HVM.Mode.Mode
open import HVM.Run.Run
open import HVM.Run.state-mut
open import HVM.Run.State.State
open import HVM.Term.Term
open import HVM.Redex.Redex
open import HVM.Net.Net

-- Pushes a new redex to the redex bag
redex-push : ∀ {mode : Mode} → Term mode → Term mode → Run mode Unit
redex-push a b = state-mut (λ state → do
  let new-rbag = MkRedex a b :: Net.rbag (State.gnet state)
  let new-gnet = record (State.gnet state) { rbag = new-rbag }
  record state { gnet = new-gnet })
