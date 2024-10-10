module Base.Pair.mut-snd where

open import Base.Pair.Pair

-- Applies a function to the second element of a pair.
-- 1st: function to apply to the second element.
-- 2nd: tnput pair.
-- = A new pair with the first element unchanged and the second element transformed.
mut-snd : ∀ {a b} {A B : Set a} {C : Set b} → (B → C) → Pair A B → Pair A C
mut-snd f (x , y) = x , f y

