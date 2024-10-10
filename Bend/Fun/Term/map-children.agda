module Bend.Fun.Term.map-children where

open import Base.List.List
open import Base.String.String
open import Base.Trait.Monad
open import Bend.Fun.Term.Term using (Term)
open import Bend.Fun.Term.mmap-children

-- Applies a function to all immediate child terms of a given term, passing the bound names.
-- - f: The function to apply to each child term, taking bound names and the term.
-- - term: The term whose children we want to map over.
-- = A new term with the function applied to all immediate children.
map-children : (List String → Term → Term) → Term → Term
map-children f term = mmap-children {{identity-monad}} f term
  where
  identity-monad : Monad (λ A → A)
  identity-monad = record { pure = λ x → x; bind = λ x f → f x }
