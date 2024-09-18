module HVM2.Run.subst-take where

open import Base.Bits.Type
open import Base.Maybe.Type
open import Base.Pair.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type
open import HVM2.Term.Type
import Base.Map.take as Map

-- Removes and retrieves a substitution from the subst map
subst-take : Bits → Run (Maybe Term)
subst-take key = λ state → do
  let (new-subs , maybe-term) = Map.take (State.subs state) key
  let new-state = record state { subs = new-subs }
  new-state , maybe-term
