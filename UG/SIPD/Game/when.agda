module UG.SIPD.Game.when where

open import UG.SIPD.Event.Event
open import UG.SIPD.Event.Click.Click
open import UG.SIPD.State.State
open import UG.SIPD.Player.Player
open import UG.SIPD.Body.Body
open import UG.SIPD.Hero.Hero
import UG.SIPD.Player.init as Player
open import Base.OrdMap.get
open import Base.OrdMap.OrdMap
open import Base.OrdMap.insert
open import Base.Pair.Pair
open import UG.SIPD.GameMap.GameMap
open import Base.Maybe.Maybe
open import UG.SIPD.Action.Action
open import Base.Nat.Nat
open import Base.Nat.Trait.Ord
open import Base.String.String
open import Base.String.Trait.Ord
open import Base.Bool.Bool
open import Base.V2.V2
open import Base.F64.F64
open import Base.Pair.Pair

-- FIXME: pid should be in the action type
pid : Nat
pid = 10

update-player-name : Maybe (Player State) → String → Nat → OrdMap Nat (Player State) → OrdMap Nat (Player State)
update-player-name maybe-player nick player-id players with maybe-player
... | None = players
... | Some player = do
  let new-player = record player { name = nick }
  insert (player-id , new-player) players

update-player-key : Maybe (Player State) → String → Bool →  Nat → V2 → OrdMap Nat (Player State) → OrdMap Nat (Player State)
update-player-key maybe-player key pressed pid mouse players with maybe-player
... | None = players
... | Some player = do
  let new-keys = insert (key , (pressed , mouse)) (Player.keys player)
  let new-player = record player { keys = new-keys }
  insert (pid , new-player) players

update-player-target : Maybe (Player State) → F64 → F64 →  Nat → OrdMap Nat (Player State) → OrdMap Nat (Player State)
update-player-target maybe-player x y pid players with maybe-player
... | None = players
... | Some player = do
  let new-target = MkV2 x y
  let new-player = record player { target = new-target }
  insert (pid , new-player) players

handle-event : Event → State → State
handle-event (KeyEvent key pressed) state = do
  let action-player = get pid (State.players state)
  let updated-players = update-player-key action-player key pressed pid (MkV2 0.0 0.0) (State.players state)
  record state { players = updated-players }

handle-event (MouseClick LeftButton x y) state = do
  let action-player = get pid (State.players state)
  let updated-players = update-player-target action-player x y pid (State.players state)
  record state { players = updated-players }

handle-event (MouseClick RightButton x y) state = state
handle-event (KeyMouse key pressed x y) state = do
  let action-player = get pid (State.players state)
  let updated-players = update-player-key action-player key pressed pid (MkV2 x y) (State.players state)
  record state { players = updated-players }

handle-event (MouseMove x y) state = state
handle-event (ActionEvent (SetNick nick)) state = do
  let action-player = get pid (State.players state)
  let updated-players = update-player-name action-player nick pid (State.players state)
  record state { players = updated-players }

get-player-name : Event → String
get-player-name (ActionEvent (SetNick nick)) = nick
get-player-name _                          = "Anon"

handle-new-player : Nat → Event → State → State
handle-new-player pid event state with (get pid (State.players state))
... | Some player = state
... | None = do
  let initial-name = get-player-name event
  let new-player = record Player.init { name = initial-name }
  let updated-players = insert (pid , new-player) (State.players state)
  let body-id = (Body.id (Hero.body (Player.hero new-player)))
  let body = Hero.body (Player.hero new-player)
  let bodies = (GameMap.bodies (State.game-map state))
  let updated-bodies = insert (body-id , body) bodies
  let updated-game-map = record (State.game-map state) { bodies = updated-bodies }
  record state { players = updated-players ; game-map = updated-game-map }

when : Event → State → State
when event state = do
  let state = handle-new-player pid event state
  let state = handle-event event state
  state
    
