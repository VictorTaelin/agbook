module UG.SIPD.Skill.Skill where

open import Base.String.String
open import Base.List.List
open import UG.SIPD.Effect.EffectType
open import Agda.Primitive

record Skill (S : Set) : Set  where
  constructor MkSkill
  field
    name : String
    effects : List (EffectType S)

