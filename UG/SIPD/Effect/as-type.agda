module UG.SIPD.Effect.as-type where

open import Base.Nat.Nat
open import UG.SIPD.Effect.EffectReturn

as-type : EffectReturn → Set
as-type Natural = Nat

