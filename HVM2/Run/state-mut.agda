module HVM2.Run.state-mut where

open import Base.Pair.Pair
open import Base.Unit.Unit
open import HVM2.Run.Run
open import HVM2.Run.State.State

-- Modifies the current state using the given function
state-mut : (State → State) → Run Unit
state-mut f = λ state → (f state , unit)
