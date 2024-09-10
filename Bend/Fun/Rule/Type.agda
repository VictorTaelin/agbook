module Bend.Fun.Rule.Type (Term : Set) where

open import Data.List.Type
open import Bend.Fun.Pattern.Type

record Rule : Set where
  constructor MkRule
  field
    pats : List Pattern
    body : Term
