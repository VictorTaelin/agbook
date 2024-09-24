module Bend.Fun.Pattern.binds where

open import Base.List.Type
open import Base.List.concat-map
open import Base.String.Type
open import Base.Maybe.Type
open import Bend.Fun.Pattern.Type

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
