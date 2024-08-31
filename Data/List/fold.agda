module Data.List.fold where

open import Data.List.Type

-- Performs a right fold over a list.
-- - f: The combining function.
-- - z: The initial value (for the empty list case).
-- - xs: The list to fold over.
-- = The result of folding the list.
fold : ∀ {a b} {A : Set a} {B : Set b} → (A → B → B) → B → List A → B
fold f z []        = z
fold f z (x :: xs) = f x (fold f z xs)
