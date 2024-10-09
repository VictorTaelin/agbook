module Bend.Transform.subst where

open import Base.Function.case
open import Base.Bool.if
open import Base.String.String
open import Base.String.eq
open import Base.List.any-true
open import Bend.Fun.Term.Term
open import Bend.Fun.Term.map-children-with-binds

-- Substitutes occurrences of a variable with a given term
-- - from: The name of the variable to substitute
-- - to: The term to substitute in place of the variable
-- - term: The term to perform substitution on
-- = A new term with substitutions applied
subst : String → Term → Term → Term
subst from to term = do
  let t' = map-children-with-binds 
            (λ binds child → 
              if (any-true (eq from) binds)
              then child
              else subst from to child)
            term
  case t' of λ where
    (Var nam) → if (eq nam from) then to else Var nam
    _ → t'

