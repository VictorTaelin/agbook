module Bend.Fun.Pattern.map-children where

open import Base.List.List
open import Base.List.map
open import Bend.Fun.Pattern.Pattern

-- Folds over a Pattern, applying the given functions to each constructor.
-- This allows for generic traversal and transformation of Pattern structures.
map-children : (Pattern → Pattern) → Pattern → Pattern
map-children f (Var x)     = Var x
map-children f (Chn x)     = Chn x
map-children f (Fan k ps)  = Fan k (map f ps)
map-children f (Ctr n ps)  = Ctr n (map f ps)
map-children f (Num x)     = Num x
map-children f (Lst ps)    = Lst (map f ps)
map-children f (Str x)     = Str x
