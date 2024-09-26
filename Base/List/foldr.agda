module Base.List.foldr where

open import Base.List.List

-- Performs a right fold over a list.
// - A: The type of elements in the input list.
// - B: The type of the result.
-- - co: The combining function.
-- - ni: The initial value (for the empty list case).
-- - xs: The list to fold over.
-- = The result of folding the list.
foldr : ∀ {a b} {A : Set a} {B : Set b} -> (A -> B -> B) -> B -> List A -> B
foldr co ni []        = ni
foldr co ni (x :: xs) = co x (foldr co ni xs)
