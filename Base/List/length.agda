module Base.List.length where

open import Base.List.List
open import Base.Nat.Nat

-- Computes the length of a list.
-- - xs: The input list.
-- = The number of elements in the list.
length : ∀ {A : Set} -> List A -> Nat
length []        = Zero
length (_ :: xs) = Succ (length xs)
