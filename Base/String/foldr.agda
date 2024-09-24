module Base.String.foldr where

import Base.List.foldr as List
open import Base.Char.Type
open import Base.List.Type
open import Base.String.Type
open import Base.String.to-list

-- Performs a right fold over a string.
-- - f: The combining function.
-- - z: The initial value (for the empty string case).
-- - s: The string to fold over.
-- = The result of folding the string.
foldr : ∀ {A : Set} -> (Char -> A -> A) -> A -> String -> A
foldr f z s = List.foldr f z (to-list s)
