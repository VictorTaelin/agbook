module UG.SIPD.Effect.apply where

open import UG.SIPD.Effect.Effect
open import UG.SIPD.Effect.EffectType
open import UG.SIPD.Effect.EffectReturn
open import UG.SIPD.Effect.as-type
open import UG.SIPD.State.State
open import Base.Pair.Pair
open import Base.List.List
open import Base.Nat.Nat
open import Base.Maybe.Maybe
open import Base.Nat.sub
open import Base.Nat.gt
open import Base.Nat.gte
open import Base.String.eq
open import Base.String.Trait.Ord
open import Base.String.String
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Bool.if
open import Base.OrdMap.get
open import Base.OrdMap.insert
open import Base.OrdMap.delete
open import UG.SIPD.GameMap.GameMap
open import UG.SIPD.Body.Body
open import UG.SIPD.Effect.move-range
open import Base.V2.V2

handle-effect-return : State → (e : EffectReturn) → as-type e → Effect (as-type e) State → State
handle-effect-return state Natural _ _ = state
handle-effect-return state Boolean _ _ = state
handle-effect-return state TicksRemaining (ticks , body-id) effect with get body-id (GameMap.bodies (State.game-map state))
... | None      = state
... | Some body with ticks > 0
...   | True = do

    -- FIXME
    let new-effect = move-range-type "projectile" (MkV2 600.0 600.0) 10.0 ticks

    let updated-effects = new-effect :: (Body.effects body)

    let updated-body = record body { effects = updated-effects }
    let updated-bodies = insert (body-id , updated-body) (GameMap.bodies (State.game-map state))
    let updated-map = record (State.game-map state) { bodies = updated-bodies }
    record state { game-map = updated-map }
...   | False = do
    let updated-bodies = delete body-id (GameMap.bodies (State.game-map state))
    let updated-map = record (State.game-map state) { bodies = updated-bodies }
    record state { game-map = updated-map }

apply : State → EffectType State → State
apply state (R , effect) = do
  let (new-state , result) = effect state
  handle-effect-return new-state R result effect

