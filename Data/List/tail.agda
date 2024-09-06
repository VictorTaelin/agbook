module Data.List.tail where

open import Data.List.Type
open import Data.Maybe.Type

-- Safely retrieves all elements of a list except the first one.
-- - xs: The input list.
-- = Some ys if the list is non-empty (where ys is the list without its first element),
--   None if the list is empty.
tail : ∀ {A : Set} → List A → Maybe (List A)
tail []        = None
tail (_ :: xs) = Some xs
