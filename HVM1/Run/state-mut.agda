module HVM1.Run.state-mut where

open import Base.Unit.Unit
open import HVM1.Run.State.State
open import HVM1.Run.Run
open import HVM1.Run.Monad.bind
open import HVM1.Run.state-get
open import HVM1.Run.state-set

state-mut : (State → State) → Run Unit
state-mut f = do
  state <- state-get
  state-set (f state)
