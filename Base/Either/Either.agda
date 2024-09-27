module Base.Either.Either where

open import Agda.Primitive using (_⊔_)

-- Represents a value of one of two possible types.
-- - A: The type of the left value.
-- - B: The type of the right value.
data Either {a b} (A : Set a) (B : Set b) : Set (a ⊔ b) where
  -- Constructs a left value.
  -- - x: A value of type A.
  Lft : A → Either A B
  
  -- Constructs a right value.
  -- - y: A value of type B.
  Rgt : B → Either A B
