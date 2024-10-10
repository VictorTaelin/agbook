module UG.SIPD.Effect.EffectReturn where

open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.String.String

data EffectReturn : Set where
  Natural : EffectReturn
  Boolean : EffectReturn
  TicksRemaining : EffectReturn

