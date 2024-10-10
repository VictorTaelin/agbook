module UG.SIPD.Hero.show where

open import UG.SIPD.Hero.Hero
open import UG.SIPD.Skill.Skill
import UG.SIPD.Skill.show as Skill
open import Base.String.String
open import Base.String.append
open import Base.OrdMap.OrdMap
open import Base.OrdMap.values
open import Base.List.List
open import Base.List.map
import Base.Nat.show as Nat

intercalate : String → List String → String
intercalate sep [] = ""
intercalate sep (x :: []) = x
intercalate sep (x :: xs) = x ++ sep ++ intercalate sep xs

-- Converts a Hero to its string representation.
-- - hero: The Hero to convert.
-- = A string representation of the Hero, showing its name, owner ID, and skills.
show : ∀ {S : Set} → Hero S → String
show hero = 
  let
    skill-strings = map Skill.show (values (Hero.skills hero))
    skills-list = "[" ++ intercalate ", " skill-strings ++ "]"
  in
  "Hero: " ++ Hero.name hero 
  ++ " (Owner ID: " ++ Nat.show (Hero.owner-id hero) ++ ")"
  ++ "\nSkills: " ++ skills-list


