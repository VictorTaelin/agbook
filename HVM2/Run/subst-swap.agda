module HVM2.Run.subst-swap where

open import Base.Maybe.Maybe
open import Base.OrdMap.OrdMap
open import Base.Pair.Pair
open import Base.String.Trait.Ord
open import Base.String.String
open import HVM2.Run.Run
open import HVM2.Run.State.State
open import HVM2.Term.Term
import Base.OrdMap.get as OrdMap
import Base.OrdMap.insert as OrdMap

-- Swaps a substitution in the state and returns the old value
subst-swap : String -> Term -> Run (Maybe Term)
subst-swap x t = λ state -> do
  let old-val = OrdMap.get x (State.subs state)
  let new-subs = OrdMap.insert (x , t) (State.subs state)
  let new-state = record state { subs = new-subs }
  new-state , old-val
