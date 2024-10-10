module UG.SIPD.Effect.Effect where

open import Base.Pair.Pair

Effect : (R : Set) → (S : Set) → Set
Effect R S = S → (Pair S R)


