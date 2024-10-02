module HVM.Run.subst-swap where

import Base.OrdMap.get as OrdMap
import Base.OrdMap.insert as OrdMap
open import Base.Maybe.Maybe
open import Base.OrdMap.OrdMap
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.Trait.Ord
open import Base.Unit.Unit
open import HVM.Mode.Mode
open import HVM.Run.Run
open import HVM.Run.State.State
open import HVM.Term.Term

-- Swaps a substitution in the state and returns the old value
subst-swap : ∀ {mode : Mode} → String → Term mode → Run mode (Maybe (Term mode))
subst-swap {WIRED} _ _ = λ state → (state , None)
subst-swap {NAMED} x t = λ state → 
  let old-val   = OrdMap.get x (State.subs state)
      new-subs  = OrdMap.insert (x , t) (State.subs state)
      new-state = record state { subs = new-subs }
  in (new-state , old-val)
