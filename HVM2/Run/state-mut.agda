module HVM2.Run.state-mut where

open import Base.Pair.Type
open import Base.Unit.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type

-- Modifies the current state using the given function
state-mut : (State -> State) -> Run Unit
state-mut f = λ state -> (f state , unit)
