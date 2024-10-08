module UG.SIPD.Effect.move where

open import Base.String.String
open import Base.V2.V2
open import Base.Bool.Bool
open import UG.SIPD.Effect.Effect
open import UG.SIPD.Effect.EffectType
open import UG.SIPD.Effect.EffectReturn
open import Base.Pair.Pair
open import UG.SIPD.State.State

-- for now does nothing, just testing
move : String → V2 → Effect Bool State
move body-id movement state = do
  state , True 

move-type : String → V2 → EffectType State
move-type body-id movement = (Boolean , (move body-id movement))
