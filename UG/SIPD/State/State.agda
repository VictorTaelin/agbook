{-# OPTIONS --no-positivity-check #-}
module UG.SIPD.State.State where

open import Base.Nat.Nat
open import Base.Unit.Unit
open import UG.SM.Tick.Tick
open import Base.OrdMap.OrdMap
open import UG.SIPD.Player.Player
open import UG.SIPD.GameMap.GameMap

-- Represents the state of the game
record State : Set where
  inductive
  constructor MkState
  field
    tick : Nat
    players : OrdMap Nat (Player State)
    game-map : GameMap State

