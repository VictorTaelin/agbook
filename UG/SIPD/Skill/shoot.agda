module UG.SIPD.Skill.shoot where

open import Base.String.String
open import Base.List.List
open import Base.V2.V2
open import Base.V2.add
open import Base.V2.mul-scalar
open import UG.SIPD.Skill.Skill
open import UG.SIPD.Effect.EffectType
open import UG.SIPD.Effect.spawn-body
open import UG.SIPD.Effect.move-range
open import UG.SIPD.Body.Body
open import UG.SIPD.State.State
open import UG.Shape.Shape
open import Base.Nat.Nat
open import Base.F64.F64
open import UG.SIPD.Body.apply-effects
open import UG.SIPD.GameMap.GameMap
open import Base.Maybe.Maybe
open import Base.String.Trait.Ord
open import Base.OrdMap.get

tick-projectile : String → State → State
tick-projectile body-id state with get body-id (GameMap.bodies (State.game-map state))
... | None = state
... | Some body = apply-effects body state

create-projectile : V2 → Body State
create-projectile position =
  MkBody "projectile" (Circle position 5.0) (tick-projectile "projectile") []

shoot : V2 → V2 → Nat → Skill State
shoot position target duration = do
  let projectile = create-projectile position
  let spawn-effect = spawn-body-type projectile
  let move-effect = move-range-type "projectile" target 10.0 duration
  MkSkill "Shoot" (spawn-effect :: move-effect :: [])

