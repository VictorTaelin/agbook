module Data.List.inits where

open import Data.List.Type
open import Data.List.map
open import Data.List.singleton

-- Returns all initial segments of a list, shortest first.
-- - xs: The input list.
-- = A list of lists, containing all initial segments of xs.
inits : ∀ {A : Set} → List A → List (List A)
inits {A = A} = λ xs → [] :: tail xs
  module Inits where
    tail : List A → List (List A)
    tail []       = []
    tail (x :: xs) = [ x ] :: map (x ::_) (tail xs)
