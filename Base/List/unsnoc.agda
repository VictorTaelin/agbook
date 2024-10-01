module Base.List.unsnoc where

open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Pair.Pair

-- Separates a list into the initial elements and the last element.
-- - xs: The input list.
-- = If the list is not empty: Some (init, last)
--   where 'init' is a list of all elements except the last,
--   and 'last' is the last element.
--   If the list is empty: None.
unsnoc : ∀ {A : Set} → List A → Pair (List A) (Maybe A)
unsnoc []        = [] , None
unsnoc (x :: []) = [] , Some x
unsnoc (x :: xs) with unsnoc xs
... | init , last = x :: init , last
