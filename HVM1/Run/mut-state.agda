module HVM1.Run.mut-state where

open import Data.Unit.Type
open import HVM1.Run.State.Type
open import HVM1.Run.Type
open import HVM1.Run.bind
open import HVM1.Run.get-state
open import HVM1.Run.set-state

mut-state : (State → State) → Run Unit
mut-state f = do
  state ← get-state
  set-state (f state)
