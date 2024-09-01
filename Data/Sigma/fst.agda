module Data.Sigma.fst where

open import Data.Sigma.Type

-- Returns the first component of a Sigma type.
-- - p: The Sigma value.
-- = The first component of p.
get-fst : ∀ {a b} {A : Set a} {B : A → Set b} → Σ A B → A
get-fst (x , _) = x
