module UG.SIPD.State.init where

open import UG.SIPD.State.Type
open import Data.Nat.Type

-- Initializes a new State with clickCount set to 0
init : State
init = MkState 0
