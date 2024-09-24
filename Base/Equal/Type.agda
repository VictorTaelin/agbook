module Base.Equal.Type where

-- Equality type for Agda.
-- Reflexivity: proof that x is equal to itself.
data _===_ {a} {A : Set a} (x : A) : A -> Set a where
  refl : x === x

-- Infix declaration for the equality operator.
infix 4 _===_

{-# BUILTIN EQUALITY _===_  #-}
