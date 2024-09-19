module Data.Maybe.map where

open import Data.Maybe.Type

-- Applies a function to the value inside a Maybe, if it exists.
-- - fn: The function to apply to the value inside the Maybe.
-- - ma: The Maybe value to operate on.
-- = A new Maybe value resulting from applying fn to the contents of ma.
map : ∀ {A B : Set} → (A → B) → Maybe A → Maybe B
map fn None     = None
map fn (Some x) = Some (fn x)
