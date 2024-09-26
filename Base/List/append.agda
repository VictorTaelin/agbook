module Base.List.append where

open import Base.List.List

-- Appends two lists.
-- Returns a new list containing all elements from both input lists.
append : ∀ {A : Set} -> List A -> List A -> List A
append []        ys = ys
append (x :: xs) ys = x :: (append xs ys)

_++_ : ∀ {A : Set} -> List A -> List A -> List A
_++_ = append

infixr 5 _++_
