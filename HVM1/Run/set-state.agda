module HVM1.Run.set-state where

open import Data.Pair.Type
open import Data.Unit.Type
open import HVM1.Run.State.Type
open import HVM1.Run.Type

set-state : State → Run Unit
set-state new-state = λ _ → (new-state , unit)
