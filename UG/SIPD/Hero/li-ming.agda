module UG.SIPD.Hero.li-ming where

open import UG.SIPD.Hero.Hero
open import Base.V2.V2
open import Base.Nat.Nat
open import Base.F64.F64
open import UG.SIPD.State.State
open import Base.OrdMap.insert
open import Base.OrdMap.OrdMap
open import Base.OrdMap.empty
open import UG.SIPD.Skill.move
open import UG.SIPD.Skill.Skill
open import Base.Pair.Pair
open import Base.String.Trait.Ord
open import Base.String.String

make-skills : String → Nat → OrdMap String (Skill State)
make-skills body-id speed = do
  let s = empty
  let s = insert ("W" , (move body-id (MkV2 0.0 -1.0) speed)) s
  let s = insert ("A" , (move body-id (MkV2 -1.0 0.0) speed)) s
  let s = insert ("S" , (move body-id (MkV2 0.0 1.0) speed)) s
  let s = insert ("D" , (move body-id (MkV2 1.0 0.0) speed)) s
  s

li-ming : Nat → V2 → Hero State
li-ming owner-id pos = do
  let body-id = "something?"
  let speed = 5
  let skills = make-skills body-id speed
  MkHero owner-id "li-ming" skills
  
  
