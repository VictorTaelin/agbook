module Base.Pair.get-fst where

open import Base.Pair.Pair

-- Retrieves the first component of a dependent pair.
-- - 1st: The dependent pair.
-- = The first component of the pair.
get-fst : ∀ {a b} {A : Set a} {B : A → Set b} → Sigma A B → A
get-fst (x , _) = x

