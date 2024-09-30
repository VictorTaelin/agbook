module Base.Pair.mut-fst where

open import Base.Pair.Pair

mut-fst : ∀ {a b} {A B : Set a} {C : Set b} → (A → C) → Pair A B → Pair C B
mut-fst f (x , y) = f x , y
