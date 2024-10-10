module UG.SIPD.Body.apply-effects where

open import UG.SIPD.Body.Body
open import UG.SIPD.State.State
open import UG.SIPD.Effect.apply
open import Base.List.List
open import UG.SIPD.GameMap.GameMap
open import Base.OrdMap.insert
open import UG.SIPD.Effect.EffectType
open import Base.Pair.Pair
open import Base.String.Trait.Ord

-- Applies all effects of a body to the game state, removing each effect after application.
-- - body: The body whose effects are to be applied.
-- - state: The current game state.
-- = The updated game state after applying all effects of the body and removing them.
apply-effects : Body State → State → State
apply-effects body state = apply-effects-helper body state (Body.effects body)
  where
    apply-effects-helper : Body State → State → List (EffectType State) → State
    apply-effects-helper body state []       = state
    apply-effects-helper body state (e :: es) = do
      let updated-body = record body { effects = es }
      let updated-bodies = insert (Body.id body , updated-body) (GameMap.bodies (State.game-map state))
      let updated-map = record (State.game-map state) { bodies = updated-bodies }
      let final-state = record state { game-map = updated-map }
      let new-state = apply final-state e
      apply-effects-helper updated-body new-state es
