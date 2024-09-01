module Data.Vector.Type where

open import Data.Nat.Type

-- Defines a vector (length-indexed list) datatype.
-- - A: The type of elements in the vector.
-- - n: The length of the vector.
data Vector (A : Set) : Nat → Set where
  []   : Vector A Zero
  _::_ : ∀ {n} → A → Vector A n → Vector A (Succ n)

infixr 5 _::_
