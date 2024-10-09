module HVM.Run.state-mut where

open import Base.Pair.Pair
open import Base.Unit.Unit
open import HVM.Run.Run
open import HVM.Run.State.State

-- Modifies the current state using the given function
state-mut : (State → State) → Run Unit
state-mut f = λ state → (f state , unit)

