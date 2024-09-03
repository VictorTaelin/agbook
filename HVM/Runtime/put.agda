module HVM.Runtime.put where

open import HVM.Runtime.Type
open import HVM.State.Type
open import Data.Unit.Type
open import Data.Pair.Type

-- Sets the current state
put : State → Runtime Unit
put new-state = λ _ → (new-state , unit)
