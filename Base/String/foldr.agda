module Base.String.foldr where

import Base.List.foldr as List
open import Base.Char.Type
open import Base.List.Type
open import Base.String.Type
open import Base.String.to-list

-- Performs a right fold over a string.
-- - 1st: The combining function.
-- - 2nd: The initial value (for the empty string case).
-- - 3rd: The string to fold over.
-- = The result of folding the string.
foldr : ∀ {A : Set} -> (Char -> A -> A) -> A -> String -> A
foldr f z s = List.foldr f z (to-list s)