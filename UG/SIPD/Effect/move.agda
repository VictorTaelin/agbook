module UG.SIPD.Effect.move where

open import Base.String.String
open import Base.V2.V2
open import Base.Bool.Bool
open import UG.SIPD.Effect.Effect
open import UG.SIPD.Effect.EffectType
open import UG.SIPD.Effect.EffectReturn
open import Base.Pair.Pair
open import UG.SIPD.State.State
open import UG.SIPD.Body.Body
open import UG.SIPD.GameMap.GameMap
open import UG.SIPD.Player.Player

open import Base.Maybe.Maybe
open import Base.OrdMap.get
open import Base.OrdMap.insert
open import Base.String.Trait.Ord
open import Base.V2.V2
open import Base.V2.add
open import Base.V2.sub
open import Base.V2.normalize
import UG.Shape.move as Shape
import UG.Shape.get-center as Shape
open import Base.Nat.Nat
open import Base.Nat.Trait.Ord

move : Nat → String → Effect Bool State
move pid body-id state with get pid (State.players state) | get body-id (GameMap.bodies (State.game-map state))
... | None        | _         = state , False
... | _           | None      = state , False
... | Some player | Some body = do
  let bodies = (GameMap.bodies (State.game-map state))
  let hitbox = (Body.hitbox body)
  let hitbox-center = Shape.get-center hitbox
  let movement = normalize ((Player.target player) - hitbox-center)
  let new-hitbox = Shape.move hitbox movement 
  let updated-body = record body { hitbox = new-hitbox }
  let updated-bodies = insert (body-id , updated-body) bodies
  let updated-map = record (State.game-map state) { bodies = updated-bodies }
  let updated-state = record state { game-map = updated-map }
  updated-state , True

move-type : Nat → String → EffectType State
move-type pid body-id = (Boolean , (move pid body-id))
