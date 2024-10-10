module UG.SIPD.Effect.move-range where

import Base.F64.sub as F64
import Base.Nat.sub as Nat
import UG.Shape.get-center as Shape
import UG.Shape.move as Shape
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.F64.F64
open import Base.F64.lt
open import Base.F64.lte
open import Base.F64.min
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.Trait.Ord
open import Base.OrdMap.get
open import Base.OrdMap.insert
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.Trait.Ord
open import Base.V2.V2
open import Base.V2.add
open import Base.V2.length
open import Base.V2.mul-scalar
open import Base.V2.normalize
open import Base.V2.sub
open import UG.SIPD.Body.Body
open import UG.SIPD.Effect.Effect
open import UG.SIPD.Effect.EffectReturn
open import UG.SIPD.Effect.EffectType
open import UG.SIPD.GameMap.GameMap
open import UG.SIPD.Player.Player
open import UG.SIPD.State.State
import Base.Nat.sub as Nat

--record Continuous where
--  body-id : String
--  next-effect : Nat → EffectType State
--  next-effect = move-range-type body-id target range (duration - 1)
-- as-type Continuous = Continuous record

move-range : String → V2 → F64 → Nat → Effect (Pair Nat String) State
move-range body-id target range duration state with get body-id (GameMap.bodies (State.game-map state))
... | None      = state , (Zero , body-id)
... | Some body = do
  let bodies = (GameMap.bodies (State.game-map state))
  let hitbox = (Body.hitbox body)
  let hitbox-center = Shape.get-center hitbox
  let distance-to-target = target - hitbox-center
  let ln = length distance-to-target
  
  if (ln < 1.0)
    then state , (0 , body-id)
    else do
      let constant-speed = 1.0
      let direction = normalize distance-to-target
      let movement = mul-scalar direction constant-speed 
      let new-center = hitbox-center + movement
      let new-hitbox = Shape.move hitbox movement 
      let updated-body = record body { hitbox = new-hitbox }
      let updated-bodies = insert (body-id , updated-body) bodies
      let updated-map = record (State.game-map state) { bodies = updated-bodies }
      let updated-state = record state { game-map = updated-map }
      updated-state , ((duration Nat.- 1) , body-id)

move-range-type : String → V2 → F64 → Nat → EffectType State
move-range-type body-id target range duration = 
  (TicksRemaining , move-range body-id target range duration)


