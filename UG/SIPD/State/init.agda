module UG.SIPD.State.init where

open import Base.Nat.Nat
open import UG.SIPD.State.State

-- Initializes a new State with clickCount set to 0
init : State
init = MkState 0
