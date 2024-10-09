module UG.SIPD.State.show where

import Base.Nat.show as Nat
import UG.SIPD.GameMap.show as GameMap
import UG.SIPD.Player.show as Player
open import Base.List.List
open import Base.List.map
open import Base.OrdMap.values
open import Base.String.String
open import Base.String.append
open import Base.String.join
open import UG.SIPD.State.State

-- Converts a State to its string representation.
-- - state: The State to convert.
-- = A string representation of the given State.
show : State → String
show state =
  let
    tick-str = "Tick: " ++ Nat.show (State.tick state)
    players-str = "Players: [" ++ 
                  join ", " (map Player.show (values (State.players state))) ++
                  "]"
    game-map-str = "GameMap: " ++ GameMap.show (State.game-map state)
  in
  "State {\n  " ++ join "\n  " (tick-str :: players-str :: game-map-str :: []) ++ "\n}"
