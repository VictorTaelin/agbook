module UG.SIPD.Skill.apply where

open import UG.SIPD.Skill.Skill
open import UG.SIPD.Effect.Effect
open import UG.SIPD.Effect.EffectType
open import Base.List.List
open import Base.List.foldl
open import Base.Pair.Pair
open import Base.Maybe.Maybe
import UG.SIPD.Effect.apply as Effect
open import UG.SIPD.State.State

-- Applies all effects of a skill to the state
apply : Skill State → State → State
apply skill state = 
  foldl Effect.apply state (Skill.effects skill)

