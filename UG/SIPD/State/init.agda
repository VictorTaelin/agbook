module UG.SIPD.State.init where

open import Base.Nat.Nat
open import Base.OrdMap.OrdMap
open import Base.OrdMap.empty
open import Base.OrdMap.insert
open import Base.Pair.Pair
open import UG.SIPD.State.State
open import UG.SIPD.Player.Player
open import Base.Nat.Trait.Ord
import UG.SIPD.Player.init as Player
import UG.SIPD.GameMap.init as GameMap

-- Initializes a new State with clickCount set to 0 and a default player with id 1
init : State
init = MkState 0 (insert (1 , Player.init) empty) (GameMap.init 200 200)
