module Bend.Fun.MatchRule.Type (Term : Set) where

open import Data.List.Type
open import Data.Maybe.Type
open import Data.String.Type

-- A rule in a pattern matching expression ('match')
record MatchRule : Set where
  constructor MkMatchRule
  field
    name  : String              -- The constructor being matched
    binds : List (Maybe String) -- The variables bound in this elimination
    body  : Term                -- The body of the rule
