module HVM2.Run.set-state where

open import Data.Pair.Type
open import Data.Unit.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type

-- Sets the current state
set-state : State → Run Unit
set-state new-state = λ _ → (new-state , unit)
