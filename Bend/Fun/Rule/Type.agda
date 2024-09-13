module Bend.Fun.Rule.Type (Term : Set) where

open import Data.List.Type
open import Bend.Fun.Pattern.Type

-- Represents a pattern matching rule in a function definition
record Rule : Set where
  constructor MkRule
  field
    pats : List Pattern  -- The patterns to match against
    body : Term          -- The body of the rule
