module UG.SIPD.Hero.Hero where

open import UG.SIPD.Skill.Skill
open import Base.Nat.Nat
open import Base.String.String
open import Base.OrdMap.OrdMap

record Hero (S : Set) : Set where
  constructor MkHero
  field
    owner-id : Nat
    name : String
    skills : OrdMap String (Skill S)

