module HVM2.Run.swap-subst where

open import Data.Bits.Type
open import Data.Maybe.Type
open import Data.Pair.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type
open import HVM2.Term.Type
import Data.Map.swap as Map

-- Swaps a substitution in the state and returns the old value
swap-subst : Bits → Term → Run (Maybe Term)
swap-subst x t = λ state → do
  let (new-subs , old-val) = Map.swap (State.subs state) x t
  let new-state = record state { subs = new-subs }
  new-state , old-val
