module UG.SIPD.Effect.EffectType where

open import Base.Pair.Pair
open import UG.SIPD.Effect.Effect
open import UG.SIPD.Effect.as-type
open import UG.SIPD.Effect.EffectReturn
open import Agda.Primitive
open import Base.Nat.Nat

EffectType : Set → Set
EffectType S = Σ EffectReturn (λ R → Effect (as-type R) S)

