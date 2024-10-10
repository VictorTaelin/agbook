module Base.List.match where

open import Base.List.List

-- Dependent eliminator for lists.
-- - A: The type of elements in the list.
-- - P: The motive (type family) for the elimination.
-- - nil: The result for the empty list case.
-- - cons: The function to apply for the cons case.
-- - xs: The list to eliminate (scrutinee).
-- = The result of the elimination, whose type depends on the input list.
match
  : ∀ {a p} {A : Set a}
  → (P : List A → Set p)
  → P []
  → ((x : A) → (xs : List A) → P (x :: xs))
  → (xs : List A)
  → P xs
match P nil cons []        = nil
match P nil cons (x :: xs) = cons x xs

