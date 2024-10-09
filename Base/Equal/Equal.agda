module Base.Equal.Equal where

-- Equality type for Agda.
data _≡_ {a} {A : Set a} (x : A) : A → Set a where
  -- Reflexivity: Proof that x is equal to itself.
  refl : x ≡ x

-- Infix declaration for the equality operator.
infix 4 _≡_

{-# BUILTIN EQUALITY _≡_  #-}

