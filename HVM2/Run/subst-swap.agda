module HVM2.Run.subst-swap where

open import Base.Bits.Type
open import Base.Maybe.Type
open import Base.Pair.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type
open import HVM2.Term.Type
import Base.Map.swap as Map

-- Swaps a substitution in the state and returns the old value
subst-swap : Bits → Term → Run (Maybe Term)
subst-swap x t = λ state → do
  let (new-subs , old-val) = Map.swap (State.subs state) x t
  let new-state = record state { subs = new-subs }
  new-state , old-val
