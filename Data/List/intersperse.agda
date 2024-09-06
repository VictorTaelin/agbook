module Data.List.intersperse where

open import Data.List.Type

-- Intersperses a value between all other values of a list.
-- - x: The value to intersperse.
-- - xs: The input list.
-- = A new list with x inserted between all elements of xs.
intersperse : ∀ {A : Set} → A → List A → List A
intersperse x []        = []
intersperse x (y :: []) = y :: []
intersperse x (y :: ys) = y :: x :: intersperse x ys
