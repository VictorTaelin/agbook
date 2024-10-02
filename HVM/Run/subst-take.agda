module HVM.Run.subst-take where

import Base.OrdMap.get as OrdMap
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

-- Retrieves a substitution from the subst map without removing it
subst-take : ∀ {mode : Mode} → String → Run mode (Maybe (Term mode))
subst-take {WIRED} _   = λ state → (state , None)
subst-take {NAMED} key = λ state → 
  let maybe-term = OrdMap.get key (State.subs state)
  in (state , maybe-term)
