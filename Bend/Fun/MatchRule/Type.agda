module Bend.Fun.MatchRule.Type (Term : Set) where

open import Data.List.Type
open import Data.Maybe.Type
open import Data.String.Type

record MatchRule : Set where
  constructor MkMatchRule
  field
    name  : String
    binds : List (Maybe String)
    body  : Term
