module UG.SIPD.Effect.as-type where

open import Base.Nat.Nat
open import Base.Bool.Bool
open import Base.Pair.Pair
open import Base.String.String
open import UG.SIPD.Effect.EffectReturn

as-type : EffectReturn → Set
as-type Natural = Nat
as-type Boolean = Bool
as-type TicksRemaining = Pair Nat String

