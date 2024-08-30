module Vector.Main where

open import Nat.Main

-- Defines a vector (length-indexed list) datatype
-- A: the type of elements in the vector
-- n: the length of the vector
data Vector (A : Set) : Nat → Set where
  []  : Vector A zero
  _∷_ : ∀ {n} → A → Vector A n → Vector A (succ n)

infixr 5 _∷_
