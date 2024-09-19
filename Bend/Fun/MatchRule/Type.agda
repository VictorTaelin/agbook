module Bend.Fun.MatchRule.Type (Term : Set) where

open import Base.List.Type
open import Base.Maybe.Type
open import Base.String.Type

-- A rule in a pattern matching expression ('match')
record MatchRule : Set where
  constructor MkMatchRule
  field
    name  : Maybe String        -- The constructor or variable being matched
    binds : List (Maybe String) -- The variables bound in this elimination
    body  : Term                -- The body of the rule
