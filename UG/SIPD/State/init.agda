module UG.SIPD.State.init where

open import Base.Nat.Type
open import UG.SIPD.State.Type

-- Initializes a new State with clickCount set to 0
init : State
init = MkState 0
