module UG.SIPD.Effect.spawn-body where

open import Base.Bool.Bool
open import Base.List.List
open import Base.OrdMap.insert
open import Base.Pair.Pair
open import Base.String.String
open import Base.V2.V2
open import UG.SIPD.Body.Body
open import UG.SIPD.Effect.Effect
open import UG.SIPD.Effect.EffectReturn
open import UG.SIPD.Effect.EffectType
open import UG.SIPD.GameMap.GameMap
open import UG.SIPD.State.State
open import UG.Shape.Shape
open import UG.SIPD.Body.Body
open import Base.String.Trait.Ord

spawn-body : Body State → Effect Bool State
spawn-body new-body state = do
  let updated-bodies = insert ((Body.id new-body) , new-body) (GameMap.bodies (State.game-map state))
  let updated-map = record (State.game-map state) { bodies = updated-bodies }
  let updated-state = record state { game-map = updated-map }
  updated-state , True

spawn-body-type : Body State → EffectType State
spawn-body-type body = (Boolean , spawn-body body)
