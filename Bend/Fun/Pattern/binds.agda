module Bend.Fun.Pattern.binds where

open import Base.List.List
open import Base.List.concat-map
open import Base.String.String
open import Base.Maybe.Maybe
open import Bend.Fun.Pattern.Pattern

-- Extracts all bound variable names from a Pattern.
-- - pat: The pattern to extract bindings from.
-- = A list of all bound variable names in the pattern.
binds : Pattern -> List String
binds (Var (Some name)) = name :: []
binds (Var None) = []
binds (Chn _) = []
binds (Fan _ pats) = concat-map binds pats
binds (Ctr _ pats) = concat-map binds pats
binds (Lst pats)   = concat-map binds pats
binds (Num _) = []
binds (Str _) = []
