module UG.SIPD.Effect.increment-tick where

open import Base.Nat.Nat
open import UG.SIPD.Effect.Effect
open import UG.SIPD.Effect.EffectType
open import UG.SIPD.Effect.EffectReturn
open import Base.Pair.Pair
open import UG.SIPD.State.State

increment-tick : Effect Nat State
increment-tick state = do
  let old-tick = (State.tick state)
  let new-tick = Succ old-tick
  let new-state = record state { tick = new-tick }
  new-state , old-tick

increment-tick-type : EffectType State
increment-tick-type = (Natural , increment-tick)
