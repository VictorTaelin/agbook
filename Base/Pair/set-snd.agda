module Base.Pair.set-snd where

open import Base.Pair.Type

set-snd : ∀ {a b} {A B : Set a} {C : Set b} -> C -> Pair A B -> Pair A C
set-snd z (x , _) = x , z
