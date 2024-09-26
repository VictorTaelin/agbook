module Base.Pair.set-fst where

open import Base.Pair.Pair

set-fst : ∀ {a b} {A B : Set a} {C : Set b} -> C -> Pair A B -> Pair C B
set-fst z (x , y) = z , y
