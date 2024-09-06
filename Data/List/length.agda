module Data.List.length where

open import Data.List.Type
open import Data.Nat.Type

-- Computes the length of a list.
-- - xs: The input list.
-- = The number of elements in the list.
length : ∀ {A : Set} → List A → Nat
length []        = Zero
length (_ :: xs) = Succ (length xs)
