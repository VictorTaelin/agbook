module UG.SIPD.Hero.li-ming where

open import UG.SIPD.Hero.Hero
open import Base.V2.V2
open import Base.Nat.Nat
open import Base.F64.F64
open import UG.SIPD.State.State
open import Base.OrdMap.insert
open import Base.OrdMap.get
open import Base.OrdMap.OrdMap
open import Base.OrdMap.empty
open import UG.SIPD.Skill.move
open import UG.SIPD.Skill.Skill
open import Base.Pair.Pair
open import Base.String.Trait.Ord
open import Base.String.String
open import Base.String.append
open import Base.Nat.show
open import Base.Nat.Trait.Ord
open import UG.Shape.circle
open import UG.SIPD.Body.Body
open import Base.Maybe.Maybe
open import UG.SIPD.Player.Player
open import Base.V2.sub
open import Base.V2.normalize
open import Base.Function.case
open import UG.SIPD.Skill.apply

make-skills : Nat → String → OrdMap String (Skill State)
make-skills player-id body-id = do
  let s = empty
  let s = insert ("RightClick" , (move player-id body-id)) s
  s

tick : Nat → State → State
tick pid state with get pid (State.players state)
... | None = state
... | Some player = do
  let hero = Player.hero player
  let skills = Hero.skills hero
  case get "RightClick" skills of λ where
    None → state
    (Some skill) → apply skill state

li-ming : Nat → V2 → Hero State
li-ming owner-id pos = do
  let name = "li-ming"
  let shape = circle pos 20.0
  let body-id = name ++ "_" ++ (show owner-id)
  let skills = make-skills owner-id body-id
  let body = MkBody body-id shape (tick owner-id)
  MkHero owner-id name skills body

