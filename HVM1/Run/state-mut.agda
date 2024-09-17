module HVM1.Run.state-mut where

open import Data.Unit.Type
open import HVM1.Run.State.Type
open import HVM1.Run.Type
open import HVM1.Run.bind
open import HVM1.Run.state-get
open import HVM1.Run.state-set

state-mut : (State → State) → Run Unit
state-mut f = do
  state ← state-get
  state-set (f state)
