module Base.List.foldr where

open import Base.List.Type

-- Performs a right fold over a list.
-- - f: The combining function.
-- - z: The initial value (for the empty list case).
-- - xs: The list to fold over.
-- = The result of folding the list.
foldr : ∀ {a b} {A : Set a} {B : Set b} → (A → B → B) → B → List A → B
foldr f z []        = z
foldr f z (x :: xs) = f x (foldr f z xs)
