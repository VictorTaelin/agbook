module UG.SIPD.Skill.move where

open import UG.SIPD.Skill.Skill
open import UG.SIPD.State.State
import UG.SIPD.Effect.move as Effect
open import Base.V2.V2
open import Base.V2.mul-scalar
open import Base.V2.normalize
open import Base.F64.from-nat
open import Base.Nat.Nat
open import Base.String.String
open import Base.List.List

move : String → V2 → Nat → Skill State
move body-id direction speed = do
  let normalized = normalize direction
  let movement = mul-scalar normalized (from-nat speed)
  MkSkill "move" ((Effect.move-type body-id movement) :: [])
