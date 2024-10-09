module UG.SIPD.Skill.apply where

open import UG.SIPD.Skill.Skill
open import UG.SIPD.Effect.Effect
open import UG.SIPD.Effect.EffectType
open import Base.List.List
open import Base.List.foldl
open import Base.Pair.Pair
open import Base.Maybe.Maybe

-- Applies a single effect to the state
apply-effect : ∀ {S : Set} → S → EffectType S → S
apply-effect state (R , effect) = do
  let (new-state , _) = effect state
  new-state

-- Applies all effects of a skill to the state
apply : ∀ {S : Set} → Skill S → S → S
apply skill state = 
  foldl apply-effect state (Skill.effects skill)
