module UG.SIPD.Effect.Effect where

open import Base.Pair.Pair
open import UG.SIPD.State.State
open import Agda.Primitive 

Effect : (R : Set) → Set
Effect R = State → (Pair State R)

EffectType : Set (lsuc lzero)
EffectType = Σ Set (λ R → Effect R)

