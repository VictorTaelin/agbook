module UG.SIPD.Game.tick where

open import UG.SIPD.State.State
open import Base.Nat.Nat
open import UG.SIPD.GameMap.GameMap
open import UG.SIPD.Body.Body
open import Base.OrdMap.values
open import Base.List.foldl

tick : State → State
tick state = do
  let updated-gs = foldl (λ acc body → (Body.tick body) acc) state (values (GameMap.bodies (State.game-map state)))
  let updated-tick = Succ (State.tick updated-gs)
  let updated-gs = record updated-gs { tick = updated-tick }  
  updated-gs
  

