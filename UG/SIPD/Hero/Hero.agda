module UG.SIPD.Hero.Hero where

open import UG.SIPD.Skill.Skill

record Hero : Set where
  constructor MkHero
  field
    owner-id : Nat
    name : String
    skills : OrdMap String Skill

