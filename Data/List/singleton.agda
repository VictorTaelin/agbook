module Data.List.singleton where

open import Data.List.Type

-- Creates a list containing a single element.
-- - x: The element to be placed in the list.
-- = A new list containing only the given element.
singleton : ∀ {A : Set} → A → List A
singleton x = x :: []

[_] : ∀ {A : Set} → A → List A
[_] = singleton
