module Base.List.last where

open import Base.List.Type
open import Base.Maybe.Type

-- Safely retrieves the last element of a list.
-- - xs: The input list.
-- = Some x if the list is non-empty (where x is the last element),
--   None if the list is empty.
last : ∀ {A : Set} → List A → Maybe A
last []        = None
last (x :: []) = Some x
last (_ :: xs) = last xs
