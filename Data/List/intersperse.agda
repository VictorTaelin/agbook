module Data.List.intersperse where

open import Data.List.Type

-- Intersperses a value between all other values of a list.
intersperse : ∀ {A : Set} → A → List A → List A
intersperse x [] = []
intersperse x (y :: []) = y :: []
intersperse x (y :: ys) = y :: x :: intersperse x ys
