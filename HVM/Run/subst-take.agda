module HVM.Run.subst-take where

import Base.OrdMap.get as OrdMap
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

-- Retrieves a substitution from the subst map without removing it
subst-take : String → Run (Maybe Term)
subst-take key = λ state → 
  let maybe-term = OrdMap.get key (State.subs state)
  in (state , maybe-term)

