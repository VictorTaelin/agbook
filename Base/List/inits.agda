module Base.List.inits where

open import Base.List.Type
open import Base.List.map
open import Base.List.singleton

-- Returns all initial segments of a list, shortest first.
-- - xs: The input list.
-- = A list of lists, containing all initial segments of xs.
inits : ∀ {A : Set} -> List A -> List (List A)
inits {A = A} = λ xs -> [] :: tail xs
  module Inits where
    tail : List A -> List (List A)
    tail []       = []
    tail (x :: xs) = [ x ] :: map (x ::_) (tail xs)
