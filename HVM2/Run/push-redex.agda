module HVM2.Run.push-redex where

open import Data.Unit.Type
open import Data.List.Type
open import HVM2.Run.Type
open import HVM2.Run.mut-state
open import HVM2.Run.State.Type
open import HVM2.Term.Type
open import HVM2.Redex.Type
open import HVM2.Net.Type

-- Pushes a new redex to the redex bag
push-redex : Term → Term → Run Unit
push-redex a b = mut-state (λ state → do
  let new-rbag = MkRedex a b :: Net.rbag (State.gnet state)
  let new-gnet = record (State.gnet state) { rbag = new-rbag }
  record state { gnet = new-gnet })
