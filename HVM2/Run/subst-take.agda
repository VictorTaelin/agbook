module HVM2.Run.subst-take where

import Base.OrdMap.get as OrdMap
open import Base.Maybe.Maybe
open import Base.OrdMap.OrdMap
open import Base.Pair.Pair
open import Base.String.Trait.Ord
open import Base.String.String
open import HVM2.Run.State.State
open import HVM2.Run.Run
open import HVM2.Term.Term

-- Retrieves a substitution from the subst map without removing it
subst-take : String -> Run (Maybe Term)
subst-take key = λ state -> do
  let maybe-term = OrdMap.get key (State.subs state)
  state , maybe-term
