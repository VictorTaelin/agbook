module HVM2.Run.subst-swap where

open import Base.Maybe.Type
open import Base.OrdMap.Type
open import Base.Pair.Type
open import Base.String.Trait.Ord
open import Base.String.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type
open import HVM2.Term.Type
import Base.OrdMap.get as OrdMap
import Base.OrdMap.insert as OrdMap

-- Swaps a substitution in the state and returns the old value
subst-swap : String -> Term -> Run (Maybe Term)
subst-swap x t = λ state -> do
  let old-val = OrdMap.get x (State.subs state)
  let new-subs = OrdMap.insert (x , t) (State.subs state)
  let new-state = record state { subs = new-subs }
  new-state , old-val
