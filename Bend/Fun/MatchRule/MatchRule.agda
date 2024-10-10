module Bend.Fun.MatchRule.MatchRule (Term : Set) where

open import Base.List.List
open import Base.Maybe.Maybe
open import Base.String.String

-- A rule in a pattern matching expression ('match')
record MatchRule : Set where
  constructor MkMatchRule
  field
    nam : Maybe String        -- The constructor or variable being matched
    bnd : List (Maybe String) -- The variables bound in this elimination
    bod : Term                -- The body of the rule

