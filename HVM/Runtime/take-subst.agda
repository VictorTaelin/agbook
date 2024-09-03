module HVM.Runtime.take-subst where

open import Data.Bits.Type
open import Data.Maybe.Type
open import Data.Pair.Type
open import HVM.Runtime.Type
open import HVM.State.Type
open import HVM.Term.Type
import Data.Map.take as Map

-- Removes and retrieves a substitution from the subst map
take-subst : Bits → Runtime (Maybe Term)
take-subst key = λ state → do
  let (new-subs , maybe-term) = Map.take (State.subs state) key
  let new-state = record state { subs = new-subs }
  new-state , maybe-term
