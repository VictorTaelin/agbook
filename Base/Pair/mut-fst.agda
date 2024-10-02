module Base.Pair.mut-fst where

open import Base.Pair.Pair

-- Applies a function to the first element of a pair.
-- 1st: Function to apply to the first element.
-- 2nd: Input pair.
-- = Pair with modified first element and original second element.
mut-fst : ∀ {a b} {A B : Set a} {C : Set b} → (A → C) → Pair A B → Pair C B
mut-fst f (x , y) = f x , y