module UG.SIPD.State.draw where

open import Base.IO.ALL
open import Base.List.List
open import Base.Unit.Unit
open import UG.SIPD.Renderer.Renderer
open import UG.SIPD.Window.Window
open import UG.SIPD.State.State
open import UG.SIPD.Renderer.clear as Renderer
open import UG.SIPD.Renderer.present as Renderer
open import Base.Nat.Nat
open import Base.OrdMap.values
open import Base.List.mmap
open import Base.List.map
open import Base.List.mfoldl

open import UG.SIPD.Player.Player
open import UG.SIPD.Hero.Hero

import UG.SIPD.Body.draw as Body

postulate draw-clicks : Renderer → Nat → IO Unit

draw-players : Renderer → State → IO Unit
draw-players renderer state = do
  let players = values (State.players state)
  let heroes = map (λ p → (Player.hero p)) players
  let bodies = map (λ h → (Hero.body h)) heroes
  mfoldl (λ _ body → Body.draw renderer body) unit bodies

draw : Renderer → State → IO Unit
draw renderer state = do
  draw-players renderer state

