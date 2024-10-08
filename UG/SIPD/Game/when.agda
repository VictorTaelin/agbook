module UG.SIPD.Game.when where

open import UG.SIPD.Event.Event
open import UG.SIPD.Event.Click.Click
open import UG.SIPD.State.State
open import UG.SIPD.Player.Player
import UG.SIPD.Player.init as Player
open import Base.OrdMap.get
open import UG.SIPD.GameMap.GameMap
open import Base.Maybe.Maybe

when : Event → State → State
when event state = do
  let players = (State.players state)
  let bodies = (GameMap.bodies (State.game-map state))
  -- TODO: implement when correctly when we have the action type complete 
  state
    
