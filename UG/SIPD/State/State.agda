module UG.SIPD.State.State where

open import Base.Nat.Nat
open import Base.Unit.Unit
open import UG.SM.Tick.Tick
open import Base.OrdMap.OrdMap
open import UG.SIPD.Player.Player

-- Represents the state of the game
record State : Set where
  constructor MkState
  field
    clickCount  : Nat
    players : OrdMap Nat Player

