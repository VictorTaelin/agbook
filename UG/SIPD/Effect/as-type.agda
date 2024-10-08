module UG.SIPD.Effect.as-type where

open import Base.Nat.Nat
open import Base.Bool.Bool
open import UG.SIPD.Effect.EffectReturn

as-type : EffectReturn → Set
as-type Natural = Nat
as-type Boolean = Bool

