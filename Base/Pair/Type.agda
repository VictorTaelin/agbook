module Base.Pair.Type where

open import Agda.Primitive

-- Dependent pair type (Sigma type)
record Sigma {a b} (A : Set a) (B : A → Set b) : Set (a ⊔ b) where
  constructor _,_
  field
    fst : A
    snd : B fst

open Sigma public

infixr 4 _,_

{-# BUILTIN SIGMA Sigma #-}

-- Σ as a synonym for Sigma
Σ = Sigma

-- Simple pair type
Pair : ∀ {a b} (A : Set a) (B : Set b) → Set (a ⊔ b)
Pair A B = Sigma A (λ _ → B)
