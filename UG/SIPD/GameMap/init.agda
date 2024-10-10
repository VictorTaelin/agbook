module UG.SIPD.GameMap.init where

open import Base.Nat.Nat
open import UG.SIPD.GameMap.GameMap
open import Base.OrdMap.empty
open import UG.SIPD.State.State

init : Nat → Nat → GameMap State
init width height = MkGameMap width height empty

