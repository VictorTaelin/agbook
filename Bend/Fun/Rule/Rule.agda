module Bend.Fun.Rule.Rule (Term : Set) where

open import Base.List.List
open import Bend.Fun.Pattern.Pattern

-- Represents a pattern matching rule in a function definition
record Rule : Set where
  constructor MkRule
  field
    pats : List Pattern  -- The patterns to match against
    body : Term          -- The body of the rule
