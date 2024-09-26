module Base.Pair.mut-snd where

open import Base.Pair.Pair

mut-snd : ∀ {a b} {A B : Set a} {C : Set b} -> (B -> C) -> Pair A B -> Pair A C
mut-snd f (x , y) = x , f y
