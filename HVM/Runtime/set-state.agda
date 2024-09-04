module HVM.Runtime.set-state where

open import Data.Pair.Type
open import Data.Unit.Type
open import HVM.Runtime.Type
open import HVM.State.Type

-- Sets the current state
set-state : State → Runtime Unit
set-state new-state = λ _ → (new-state , unit)
