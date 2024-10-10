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
open import Base.OrdMap.keys
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
open import Base.List.List
open import UG.SIPD.Body.apply-effects
open import UG.SIPD.Skill.shoot
open import Base.Bool.Bool

make-skills : Nat → String → OrdMap String (Skill State)
make-skills player-id body-id = do
  let s = empty
  let s = insert ("RightClick" , (move player-id body-id)) s
  let s = insert ("W" , (shoot (MkV2 400.0 400.0) (MkV2 600.0 600.0) 100)) s
  s

is-key-pressed : String → OrdMap String (Pair Bool V2) → Bool
is-key-pressed key player-keys with get key player-keys
... | Some (pressed , _) = pressed
... | None = False

apply-skill-if-pressed : String → OrdMap String (Skill State) → OrdMap String (Pair Bool V2) → State → State
apply-skill-if-pressed key skills player-keys state with get key skills | is-key-pressed key player-keys
... | Some skill | True  = apply skill state
... | _          | _     = state

apply-pressed-skills : List String → OrdMap String (Skill State) → OrdMap String (Pair Bool V2) → State → State
apply-pressed-skills [] _ _ state = state
apply-pressed-skills (key :: keys) skills player-keys state =
  let new-state = apply-skill-if-pressed key skills player-keys state
  in apply-pressed-skills keys skills player-keys new-state

tick : Nat → State → State
tick pid state with get pid (State.players state)
... | None = state
... | Some player = do
  let hero = Player.hero player
  let skills = Hero.skills hero
  let player-keys = Player.keys player
  let skill-keys = keys skills
  let body-effects-state = apply-effects (Hero.body hero) state
  let state-after-skills = apply-pressed-skills skill-keys skills player-keys body-effects-state
  case get "RightClick" skills of λ where
    None → state-after-skills
    (Some skill) → apply skill state-after-skills

li-ming : Nat → V2 → Hero State
li-ming owner-id pos = do
  let name = "li-ming"
  let shape = circle pos 20.0
  let body-id = name ++ "_" ++ (show owner-id)
  let skills = make-skills owner-id body-id
  let body = MkBody body-id shape (tick owner-id) []
  MkHero owner-id name skills body

