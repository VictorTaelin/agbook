module HVM2.Run.subst-take where

import Base.OrdMap.get as OrdMap
open import Base.Maybe.Type
open import Base.OrdMap.Type
open import Base.Pair.Type
open import Base.String.Trait.Ord
open import Base.String.Type
open import HVM2.Run.State.Type
open import HVM2.Run.Type
open import HVM2.Term.Type

-- Retrieves a substitution from the subst map without removing it
subst-take : String -> Run (Maybe Term)
subst-take key = λ state -> do
  let maybe-term = OrdMap.get key (State.subs state)
  state , maybe-term
