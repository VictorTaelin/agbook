module HVM.Run.subst-swap where

import Base.OrdMap.get as OrdMap
import Base.OrdMap.insert as OrdMap
open import Base.Maybe.Maybe
open import Base.OrdMap.OrdMap
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.append
open import Base.String.Trait.Ord
open import Base.Unit.Unit
open import HVM.Run.Run
open import HVM.Run.State.State
open import HVM.Term.Term
open import HVM.Addr.Addr

-- Swaps a substitution in the state and returns the old value
subst-swap : String → Term → Run (Maybe Term)
subst-swap x t = λ state → do
  let old-val  = OrdMap.get x (State.subs state)
  let new-subs = OrdMap.insert (x , t) (State.subs state)
  let new-state = record state { subs = new-subs }
  (new-state , old-val)
