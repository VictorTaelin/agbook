module Bend.Fun.Pattern.binds where

open import Base.List.List
open import Base.List.concat-map
open import Base.String.String
open import Base.Maybe.Maybe
open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.Pattern.children

-- Extracts all bound variable names from a Pattern.
-- - pat: The pattern to extract bindings from.
-- = A list of all bound variable names in the pattern.
binds : Pattern → List String
binds (Var (Some name)) = name :: []
binds pat               = concat-map binds (children pat)
