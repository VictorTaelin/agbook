module Base.Pair.Pair where

open import Agda.Primitive

-- Represents a dependent pair type (Sigma type).
-- It allows the second component to depend on the first.
record Sigma {a b} (A : Set a) (B : A → Set b) : Set (a ⊔ b) where
  constructor _,_
  field
    -- 1st: The component of the pair.
    fst : A
    -- 2nd: The component, which may depend on the 1st.
    snd : B fst

open Sigma public

infixr 4 _,_

{-# BUILTIN SIGMA Sigma #-}

-- Σ is a synonym for Sigma.
Σ = Sigma

-- Simple pair type.
-- This is a non-dependent version of Sigma.
Pair : ∀ {a b} (A : Set a) (B : Set b) → Set (a ⊔ b)
-- = A pair of elements where the second does not depend on the first.
Pair A B = Sigma A (λ _ → B)

