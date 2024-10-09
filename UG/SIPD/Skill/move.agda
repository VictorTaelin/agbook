module UG.SIPD.Skill.move where

open import UG.SIPD.Skill.Skill
open import UG.SIPD.State.State
import UG.SIPD.Effect.move as Effect
open import Base.Nat.Nat
open import Base.String.String
open import Base.List.List

move : Nat → String → Skill State
move pid body-id = MkSkill "move" ((Effect.move-type pid body-id) :: [])

