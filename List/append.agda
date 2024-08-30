module List.append where

open import List.Main

-- Concatenates two lists.
-- xs: the 1st list.
-- ys: the 2nd list.
-- = A new list containing all elements from xs followed by all elements from ys.
_++_ : ∀ {a} {A : Set a} → List A → List A → List A
[]       ++ ys = ys
(x , xs) ++ ys = x , (xs ++ ys)

infixr 5 _++_
