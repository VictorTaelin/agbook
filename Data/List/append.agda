module Data.List.append where

open import Data.List.Type

-- Concatenates two lists.
-- - xs: The 1st list.
-- - ys: The 2nd list.
-- = A new list containing all elements from xs followed by all elements from ys.
_++_ : ∀ {a} {A : Set a} → List A → List A → List A
[]        ++ ys = ys
(x :: xs) ++ ys = x :: (xs ++ ys)

infixr 5 _++_
