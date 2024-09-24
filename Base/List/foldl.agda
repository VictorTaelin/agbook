module Base.List.foldl where

open import Base.List.Type

-- Performs a left fold over a list.
-- - f: The combining function.
-- - z: The initial value (for the empty list case).
-- - xs: The list to fold over.
-- = The result of folding the list.
foldl : ∀ {a b} {A : Set a} {B : Set b} -> (A -> B -> A) -> A -> List B -> A
foldl f z []        = z
foldl f z (x :: xs) = foldl f (f z x) xs

-- NOTE: in the JS version, use a loop instead,
-- to emulate strict tail calls with foldl.
