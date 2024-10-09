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

open import Base.Maybe.Maybe
open import Base.OrdMap.get
open import Base.OrdMap.insert
open import Base.String.Trait.Ord
open import Base.V2.V2
open import Base.V2.add
import UG.Shape.move as Shape

move : String → V2 → Effect Bool State
move body-id movement state with get body-id (GameMap.bodies (State.game-map state))
... | None      = state , False
... | Some body = do
  let new-hitbox = Shape.move (Body.hitbox body) movement
  let updated-body = record body { hitbox = new-hitbox }
  let bodies = (GameMap.bodies (State.game-map state))
  let updated-bodies = insert (body-id , updated-body) bodies 
  let updated-gm = record (State.game-map state) { bodies = updated-bodies }
  let updated-gs = record state { game-map = updated-gm }
  state , True

move-type : String → V2 → EffectType State
move-type body-id movement = (Boolean , (move body-id movement))
