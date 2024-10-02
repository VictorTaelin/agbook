module Base.Pair.get-snd where

open import Base.Pair.Pair

-- Retrieves the second component of a dependent pair.
-- - 1st: The dependent pair.
-- = The second component of the pair.
get-snd : ∀ {a b} {A : Set a} {B : A → Set b} → (p : Sigma A B) → B (Sigma.fst p)
get-snd (_ , y) = y