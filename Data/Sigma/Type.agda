module Data.Sigma.Type where

open import Agda.Primitive using (_⊔_)

-- Represents a dependent pair (Σ-type).
-- - A: The type of the first component.
-- - B: A function that takes an A and returns the type of the second component.
record Σ {a b} (A : Set a) (B : A → Set b) : Set (a ⊔ b) where
  constructor _,_
  field
    fst : A
    snd : B fst

open Σ public

infixr 4 _,_

{-# BUILTIN SIGMA Σ #-}
