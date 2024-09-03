module HVM.Runtime.push-redex where

open import Data.Unit.Type
open import Data.List.Type
open import HVM.Runtime.Type
open import HVM.Runtime.modify
open import HVM.State.Type
open import HVM.Term.Type
open import HVM.Redex.Type
open import HVM.Net.Type

-- Pushes a new redex to the redex bag
push-redex : Term → Term → Runtime Unit
push-redex a b = modify (λ state → do
  let new-rbag = MkRedex a b :: Net.rbag (State.gnet state)
  let new-gnet = record (State.gnet state) { rbag = new-rbag }
  record state { gnet = new-gnet })
