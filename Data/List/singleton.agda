module Data.List.singleton where

open import Data.List.Type

-- Creates a list with 1 element.
singleton : ∀ {A : Set} → A → List A
singleton x = x :: []

[_] : ∀ {A : Set} → A → List A
[_] = singleton
