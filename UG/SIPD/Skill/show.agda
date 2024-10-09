module UG.SIPD.Skill.show where

open import UG.SIPD.Skill.Skill
open import Base.String.String
open import Base.String.append
open import Base.List.length
import Base.Nat.show as Nat

-- Converts a Skill to its string representation.
-- - skill: The Skill to convert.
-- = A string representation of the Skill, showing its name and number of effects.
show : ∀ {S : Set} → Skill S → String
show skill = Skill.name skill ++ " (Effects: " ++ Nat.show (length (Skill.effects skill)) ++ ")"

