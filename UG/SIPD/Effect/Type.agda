module UG.SIPD.Effect.Type where

open import UG.SIPD.GameState.Type

-- Represents an effect that transforms a GameState and produces a result.
-- - R: The type of the result produced by the effect.
Effect : Set → Set
Effect R = GameState → Pair GameState R
