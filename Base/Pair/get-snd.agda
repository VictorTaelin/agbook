module Base.Pair.get-snd where

open import Base.Pair.Type

get-snd : ∀ {a b} {A : Set a} {B : A → Set b} → (p : Sigma A B) → B (Sigma.fst p)
get-snd (_ , y) = y
