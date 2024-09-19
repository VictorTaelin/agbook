module Base.List.tails where

open import Base.List.Type
open import Base.List.singleton

-- Returns all final segments of a list, longest first.
-- - xs: The input list.
-- = A list of lists, containing all final segments of xs.
tails : ∀ {A : Set} → List A → List (List A)
tails {A = A} = λ xs → xs :: tail xs
  module Tails where
    tail : ∀ {A : Set} → List A → List (List A)
    tail []       = []
    tail (_ :: xs) = xs :: tail xs
