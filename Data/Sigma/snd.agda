module Data.Sigma.snd where

open import Data.Sigma.Type

-- Returns the second component of a Sigma type.
-- - p: The Sigma value.
-- = The second component of p.
get-snd : ∀ {a b} {A : Set a} {B : A → Set b} → (p : Σ A B) → B (Σ.fst p)
get-snd (_ , y) = y
